kubectl delete -f svc.yaml
envsubst < deployment.yaml | kubectl delete -f -
envsubst < docker-secret.yaml | kubectl delete -f -

kubectl delete -f security/cluster-role-binding.yaml
kubectl delete -f security/cluster-role.yaml
kubectl delete -f security/jenkins-svc-secret.yaml
kubectl delete -f security/jenkins-role-binding.yaml
kubectl delete -f security/jenkins-role.yaml
kubectl delete -f security/jenkins-sa.yaml

kubectl delete -f ns.yaml
kubectl delete -f storage/pvc-nfs.yaml






