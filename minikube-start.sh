#!/usr/bin/env dash
minikube start \
    --cpus max \
    --memory 6g \
    --kubernetes-version 1.30.0 \
    --cni cilium \
    --namespace kube-system \
    --apiserver-ips="$(ip route get 8.8.8.8 | awk ' /^[0-9]/ { print $7 }')","$(curl ifconfig.me)" \
    --extra-config kubeadm.skip-phases=addon/kube-proxy \
    "$@"
    # --alsologtostderr \