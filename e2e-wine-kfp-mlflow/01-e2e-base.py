# use virtual env from nb-requirements.txt

import kfp
from kfp import dsl
from kubernetes.client.models import V1EnvVar
from kfp.onprem import use_k8s_secret


# Steps definitions

def preprocess(file_path: kfp.components.InputPath('CSV'),
               output_file: kfp.components.OutputPath('parquet')):
    import pandas as pd
    df = pd.read_csv(file_path, header=0, sep=";")
    df.columns = [c.lower().replace(' ', '_') for c in df.columns]
    df.to_parquet(output_file)


def trainning(file_path: kfp.components.InputPath('parquet')) -> str:
    import pandas as pd
    from sklearn.model_selection import train_test_split
    from sklearn.metrics import classification_report
    import mlflow
    from sklearn.linear_model import ElasticNet

    df = pd.read_parquet(file_path)

    target_column = 'quality'
    train_x, test_x, train_y, test_y = train_test_split(
        df.drop(columns=[target_column]),
        df[target_column], test_size=.25,
        random_state=1337, stratify=df[target_column])

    with mlflow.start_run(run_name='elastic_net_models'):
        alpha = 0.5
        l1_ratio = 0.5
        lr = ElasticNet(alpha=alpha, l1_ratio=l1_ratio, random_state=42)
        lr.fit(train_x, train_y)
        result = mlflow.sklearn.log_model(lr, "model",
                                          registered_model_name="wine-elasticnet")
        return f"{mlflow.get_artifact_uri()}/{result.artifact_path}"


def deploy(model_uri: str = "default_model_uri"):
    import subprocess

    with open("/tmp/manifest.yaml", "w") as f:
        manifest = """
apiVersion: machinelearning.seldon.io/v1alpha2
kind: SeldonDeployment
metadata:
  name: mlflow
spec:
  name: wines
  predictors:
  - componentSpecs:
    - spec:
        containers:
        - name: classifier
          image: seldonio/mlflowserver:1.14.0-dev
          imagePullPolicy: Always
          livenessProbe:
            initialDelaySeconds: 80
            failureThreshold: 200
            periodSeconds: 5
            successThreshold: 1
            httpGet:
              path: /health/ping
              port: http
              scheme: HTTP
          readinessProbe:
            initialDelaySeconds: 80
            failureThreshold: 200
            periodSeconds: 5
            successThreshold: 1
            httpGet:
              path: /health/ping
              port: http
              scheme: HTTP
    graph:
      children: []
      implementation: MLFLOW_SERVER
      modelUri: """ + model_uri + """
      envSecretRefName: seldon-init-container-secret
      name: classifier
    name: wine-super-model
    replicas: 1
        """
        f.write(manifest)

    result = subprocess.call(
        ['kubectl', 'apply', '-f', '/tmp/manifest.yaml', '-n', 'admin'])
    assert result == 0


# Components
web_downloader_op = kfp.components.load_component_from_url(
    'https://raw.githubusercontent.com/kubeflow/pipelines/master/components/contrib/web/Download/component.yaml')

preprocess_op = kfp.components.create_component_from_func(
    func=preprocess,
    output_component_file='preprocess-component.yaml',
    # This is optional. It saves the component spec for future use.
    base_image='python:3.9',
    packages_to_install=['pandas', 'pyarrow'])

training_op = kfp.components.create_component_from_func(
    func=trainning,
    output_component_file='train-component.yaml',
    # This is optional. It saves the component spec for future use.
    base_image='python:3.9',
    packages_to_install=['pandas', 'pyarrow', 'sklearn', 'mlflow', 'boto3'])

deploy_op = kfp.components.create_component_from_func(
    func=deploy,
    output_component_file='deploy-component.yaml',
    # This is optional. It saves the component spec for future use.
    base_image='bponieckiklotz/seldon-deploy:0.1',
    packages_to_install=[])


# Pipeline
@dsl.pipeline(
    name="e2e_wine_pipeline",
    description="WINE pipeline",
)
def wine_pipeline(url):
    web_downloader_task = web_downloader_op(url=url)
    preprocess_task = preprocess_op(file=web_downloader_task.outputs['data'])

    train_task = (training_op(file=preprocess_task.outputs['output'])
                  .add_env_variable(V1EnvVar(name='MLFLOW_TRACKING_URI',
                                             value='http://mlflow-server.kubeflow.svc.cluster.local:5000'))
                  .add_env_variable(V1EnvVar(name='MLFLOW_S3_ENDPOINT_URL',
                                             value='http://minio.kubeflow.svc.cluster.local:9000'))
                  # https://kubeflow-pipelines.readthedocs.io/en/stable/source/kfp.extensions.html#kfp.onprem.use_k8s_secret
                  .apply(use_k8s_secret(secret_name='mlpipeline-minio-artifact',
                                        k8s_secret_key_to_env={
                                            'accesskey': 'AWS_ACCESS_KEY_ID',
                                            'secretkey': 'AWS_SECRET_ACCESS_KEY',
                                        })))
    deploy_task = deploy_op(model_uri=train_task.output)



# Execution
kfp.compiler.Compiler().compile(wine_pipeline, 'wine-pipeline.yaml')

#HAS TO HAVE ACCESS TO KUBEFLOW API
# client = kfp.Client()
# client.create_run_from_pipeline_func(
#     wine_pipeline,
#     arguments={
#         "url": "https://raw.githubusercontent.com/Barteus/kubeflow-examples/main/e2e-wine-kfp-mlflow/winequality-red.csv",
#     })
