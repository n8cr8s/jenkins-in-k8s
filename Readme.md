# Jenkins K8s Setup

How to create Docker Credentials for Kubernetes

[Kubernetes Website - Pulling Image from Private Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)

Base64 Encode ~/.docker/config.json file
```
cat  /<filepath to>/.docker/config.json | base64
```

Create set_env.sh file for running locally and set the following values

```
export DOCKERCONFIG=
export DOCKERUSERNAME=
```

To set environment variables, run the following from the command line
```
source set_env.sh
```

## Deployment Instructions

```
kubectl apply -f ns.yaml
# kubectl apply -f storage/local-storage-class.yaml
kubectl apply -f storage/pv.yaml

# Create Role for Jenkins
kubectl apply -f security/jenkins-sa.yaml
kubectl apply -f security/jenkins-role.yaml
kubectl apply -f security/jenkins-role-binding.yaml
kubectl apply -f security/jenkins-svc-secret.yaml
kubectl apply -f security/cluster-role.yaml
kubectl apply -f security/cluster-role-binding.yaml

# Deploying with env variables
envsubst < docker-secret.yaml | kubectl apply -f -
envsubst < deployment.yaml | kubectl apply -f -
kubectl apply -f svc.yaml

```

## POST JENKINS Steps: Add and change Default StorageClass for Cluster 
[https://github.com/n8cr8s/nfs-k8s-setup] (Add NFS Storage Class)
```
