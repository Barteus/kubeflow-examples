# Kubecon EU 2022

Instruction how to recreate the environment

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
```
echo -n "sa-name" > ./secret/minio-sa-name
echo -n "sa-key1" > ./secret/minio-sa-key1
```

**Do not** add new line character at the end of file!!!

## Datacenter

Minimum of 4 CPU and 16GB RAM is required

### Install k8s, juju, kubectl

### Install CKF

Deploy

```
juju deploy ./bundle.yaml --trust
```

Post deployment actions

```
kubectl patch role -n kubeflow istio-ingressgateway-operator -p '{"apiVersion":"rbac.authorization.k8s.io/v1","kind":"Role","metadata":{"name":"istio-ingressgateway-operator"},"rules":[{"apiGroups":["*"],"resources":["*"],"verbs":["*"]}]}'

juju config dex-auth static-username=admin
juju config dex-auth static-password=admin123
juju config dex-auth public-url=http://10.64.140.44.nip.io/
juju config oidc-gatekeeper public-url=http://10.64.140.44.nip.io/
```

Fix admin user namespace issues and apply the yamls

```
kubectl apply -f ./datacenter/minio-jupyter-config.yaml -f admin
kubectl apply -f ./datacenter/mlflow-jupyter-config.yaml -f admin
```

## Edge

Minimum of 4 CPU and 8GB RAM is required (works on RaspberryPi)

