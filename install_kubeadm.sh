#!/bin/bash


echo "Going to install kuadm and init a k8s..."
apt-get update && apt-get upgrade -y
apt-get install -y docker.io
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update

apt-get install -y kubeadm=1.9.1-00 kubelet=1.9.1-00


wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubeadm init --pod-network-cidr 10.244.0.0/16

useradd -m k8s
echo -e "k8s\nk8s" | passwd k8s
usermod -aG sudo k8s

cp config_kubeadm.sh /home/k8s/
echo "Done!!!!"
