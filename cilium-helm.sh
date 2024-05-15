#!/usr/bin/env dash
#1. Install cilium
helm install \
    cilium cilium/cilium \
    --version 1.15.4 \
    --namespace kube-system

# 2. set cilium tunables
cilium upgrade \
    --set kubeProxyReplacement=true \
    --set k8sServiceHost=192.168.49.2 \
    --set k8sServicePort=8443 \
    --set hubble.relay.enabled=true \
    --set hubble.ui.enabled=true \
    --set ingressController.enabled=true \
    --set ingressController.loadbalancerMode=dedicated \
    --set ingressController.default=true \
    --set loadBalancer.l7.backend=envoy \
    --set operator.replicas=1 \
    --set bgpControlPlane.enabled=true
