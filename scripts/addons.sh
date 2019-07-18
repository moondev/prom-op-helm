export KUBECONFIG=/etc/kubernetes/admin.conf

wget https://get.helm.sh/helm-v2.14.2-linux-amd64.tar.gz
tar -xf helm-v2.14.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl -n kube-system create sa tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller

kubectl get nodes
kubectl get pods --all-namespaces


# helm repo add rook-release https://charts.rook.io/release
# sleep 10
# helm install --namespace rook-ceph rook-release/rook-ceph

helm install --namespace openebs --name openebs stable/openebs
sleep 30
kubectl apply -f https://raw.githubusercontent.com/openebs/openebs/master/k8s/demo/pvc-standard-jiva-default.yaml

sleep 10
helm install --name prom-op --namespace prom-op stable/prometheus-operator -f /scripts/operator/values.yaml