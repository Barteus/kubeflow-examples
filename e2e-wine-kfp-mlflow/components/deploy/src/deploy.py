import argparse
import subprocess

# TODO change to jinja template
def deploy(model_uri: str):
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


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Data processor')
    parser.add_argument('--model_uri', help='Model URI')

    args = parser.parse_args()

    deploy(args.model_uri)
