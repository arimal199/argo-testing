#!/usr/bin/env dash

# 1. Create a Kind cluster
kind create cluster \
    --config=kind-config.yaml

# 2. Install Cilium CNI + kube-proxy replacement + ingress
cilium install \
    --set kubeProxyReplacement=true \
    --set hubble.relay.enabled=true \
    --set hubble.ui.enabled=true \
    --set ingressController.enabled=true \
    --set ingressController.loadbalancerMode=dedicated \
    --set ingressController.default=true \
    --set loadBalancer.l7.backend=envoy
