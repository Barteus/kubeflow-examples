# Kubecon EU 2022

Instruction how to recreate the environment.

## Use Azure storage

Create Azure storage and save the Access Credentials in secret folder

```
/kubecon-eu-2022
├── datacenter
├── edge
├── README.md
└── secret
    ├── minio-sa-key1
    └── minio-sa-name
```

Example:

```shell
echo -n "sa-name" > ./secret/minio-sa-name
echo -n "sa-key1" > ./secret/minio-sa-key1
```

**Do not** add new line character at the end of file!!!

Add the `mlflow` container to Azure. You can do it in Azure console.

## Datacenter

Minimum of 4 CPU and 16GB RAM is required.

### Install k8s, juju, kubectl

Check data-drift -> Tools setup section

### Install Chamed Kubeflow

Documentation: https://charmed-kubeflow.io/docs/install

For deployment to work you need to have a default storage class selected in your
k8s cluster. Use script below to select the storage class.

```shell
kubectl patch storageclass <storageclass_name> -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

Deploy

```shell
juju add-model kubeflow
juju deploy ./datacenter/bundle.yaml --trust
```

Post deployment actions

```shell
kubectl patch role -n kubeflow istio-ingressgateway-operator -p '{"apiVersion":"rbac.authorization.k8s.io/v1","kind":"Role","metadata":{"name":"istio-ingressgateway-operator"},"rules":[{"apiGroups":["*"],"resources":["*"],"verbs":["*"]}]}'

juju config dex-auth static-username=admin
juju config dex-auth static-password=admin123
juju config dex-auth public-url=http://10.64.140.44.nip.io/
juju config oidc-gatekeeper public-url=http://10.64.140.44.nip.io/
```

Use the browser to log into the `http://10.64.140.44.nip.io/` using static
credentials from above.

Now, fix admin user namespace issues and apply the yamls

```shell
kubectl apply -f ./datacenter/minio-jupyter-config.yaml -n admin
kubectl apply -f ./datacenter/mlflow-jupyter-config.yaml -n admin
```

Add the secret to the user namespace to deploy model there

```shell
kubectl create secret generic seldon-init-container-secret -n admin \
  --from-literal=RCLONE_CONFIG_S3_TYPE='s3' \
  --from-literal=RCLONE_CONFIG_S3_PROVIDER='minio' \
  --from-literal=RCLONE_CONFIG_S3_ENV_AUTH=false \
  --from-literal=RCLONE_CONFIG_S3_ENDPOINT='http://minio.kubeflow.svc.cluster.local:9000' \
  --from-literal=RCLONE_CONFIG_S3_ACCESS_KEY_ID=<access-key> \
  --from-literal=RCLONE_CONFIG_S3_SECRET_ACCESS_KEY=<secret-key>
```

### Run demo

Create the notebook instance - during the notebook creation go to
the `Configuration` section and select Access to Minio, MLFlow and pipelines.
Clone the repository there. Use the `e2e-wine-kfp-mlflow` example and execute
the notebook there. Result should be deployed model. From Deploy task take the
yaml and copy it. You will need it to deploy it on the edge cloud.

Endpoint is deployed in datacenter - this endpoint can be used a fallback in
case the edge device could not handle the load.

The `e2e-wine-kfp-mlflow` example contains both the notebook and python "code"
version of the pipeline including 3 ways to build pipeline steps.

Data drift should also be found in the automated retraining. Data drift might
force to move model to experimentation phase to review its performance. In
the `data-drift` example notebook `e2e-pipeline-drift.ipynb` shows how to use
data-drift model in training pipeline.

## Edge

Minimum of 4 CPU and 8GB RAM is required (works on RaspberryPi)

### Install k8s, juju, kubectl

Check data-drift -> Tools setup section

### Install knative

Check data-drift -> Install Knative section

### Deploy seldon and minio

Bundle contains only required parts of CKF tailed to the use-case

```shell
juju deploy ./edge/bundle.yaml --trust
```

### Deploy data-drift model

Create a namespace especially for the data-drift and model.
Let's call it `wine`.

```shell
kubectl create ns wine
```

Deploy data drift

```shell
kubectl apply -f ./edge/data-drift.yaml -n wine
```

More details and data-drift model build notebook available in the `data-drift`
example.

### Deploy the model

Create secret to allow model download from custom object storage. Adjust the
access-key and secret-key variable in the file `seldon-secret.yaml`.

```shell
kubectl create secret generic seldon-init-container-secret -n wine \
  --from-literal=RCLONE_CONFIG_S3_TYPE='s3' \
  --from-literal=RCLONE_CONFIG_S3_PROVIDER='minio' \
  --from-literal=RCLONE_CONFIG_S3_ENV_AUTH=false \
  --from-literal=RCLONE_CONFIG_S3_ENDPOINT='http://minio.kubeflow.svc.cluster.local:9000' \
  --from-literal=RCLONE_CONFIG_S3_ACCESS_KEY_ID=<access-key> \
  --from-literal=RCLONE_CONFIG_S3_SECRET_ACCESS_KEY=<secret-key>
```

Adjust the wine-super-model by changing the modelUri to the one generated by the
pipeline run. The proper value can be taken from the "Deploy" step in pipeline
ran. If you did not install the knative then only the version without data-drift
will be working.

```shell
kubectl apply -f ./edge/wine-deployment.yaml -n wine
kubectl apply -f ./edge/wine-deployment-with-drift.yaml -n wine
```

### Run demo

The demo of exposing the model in the edge device does not require the KNative
installation. You only need Seldon Core and Minio object storage. Below is the
example call to the service using the REST API. Remember to change the IP
address.

```shell
curl  -s http://10.152.183.221:8000/api/v0.1/predictions \
  -H "Content-Type: application/json" \
  -d '{"data":{"ndarray":[[10.1, 0.37, 0.34, 2.4, 0.085, 5.0, 17.0, 0.99683, 3.17, 0.65, 10.6]]}}'
```

The demo of data drift detection on edge device consist of deployed model and
data drift detection service. Model logs data asynchronously to the data drift
detection model which creates events with drift response. For the purpose of the
demo both types of events are sent to same broker.

1. Open wine-debug service

```shell
kn service list -n wine
```

2. Call the drift-wine-super-model (red wine sample)

```shell
curl  -s http://10.152.183.220:8000/api/v0.1/predictions \
  -H "Content-Type: application/json" \
  -d '{"data":{"ndarray":[[10.1, 0.37, 0.34, 2.4, 0.085, 5.0, 17.0, 0.99683, 3.17, 0.65, 10.6]]}}'
```

3. Check if drift was detected - go to the wine-debug event player and find 2
   new rows:

- seldon serving inference request with input to the model
- data drift detection request with drift value equal 0 in the event body and
  distances for every feature

4. Call the drift-wine-super-model (white wine sample)

```shell
curl  -s http://10.152.183.220:8000/api/v0.1/predictions \
  -H "Content-Type: application/json" \
  -d '{"data":{"ndarray":[[8.1, 0.27, 0.41, 1.45, 0.033, 11.0, 63.0, 0.991, 2.99, 0.56, 12.0]]}}'
```

5. Check if drift was detected - go to the wine-debug event player and find 2
   new rows:

- seldon serving inference request with input to the model
- data drift detection request with drift value equal 1 in the event body and
  distances for every feature

