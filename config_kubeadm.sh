#!/bin/bash

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f kube-flannel.yml
kubectl get node
kubectl get pods --all-namespaces

kubectl taint nodes --all node-role.kubernetes.io/master-
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

