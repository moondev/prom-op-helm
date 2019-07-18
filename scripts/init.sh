#!/bin/bash

kubeadm init --pod-network-cidr=192.168.0.0/16
sleep 30

export KUBECONFIG=/etc/kubernetes/admin.conf
# kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
sleep 30

kubeadm token create --print-join-command > /scripts/join.sh

chmod +x /scripts/join.sh

