#!/bin/bash

DOCKER=17.03
K8S=1.10.13
CNI=0.6.0

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
apt-get update && apt-get install -y docker-ce=$(apt-cache madison docker-ce | grep ${DOCKER} | head -1 | awk '{print $3}')
apt-get install -y kubelet=${K8S}-00 kubeadm=${K8S}-00 kubectl=${K8S}-00 kubernetes-cni=${CNI}-00
sysctl net.bridge.bridge-nf-call-iptables=1