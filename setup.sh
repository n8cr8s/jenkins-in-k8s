kubectl apply -f ns.yaml
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

curl -skSL https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/v4.8.0/deploy/install-driver.sh | bash -s v4.8.0 --