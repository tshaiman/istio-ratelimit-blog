#!/bin/sh

echo "installing kind"
kind create cluster --config kind-config.yaml

echo "loading images"

docker pull istio/pilot:1.24.0
docker pull istio/proxyv2:1.24.0
kind load docker-image istio/pilot:1.24.0
kind load docker-image istio/proxyv2:1.24.0

echo "pre-requisites: installing kind provider Kind LoadBalancer"
go install sigs.k8s.io/cloud-provider-kind@latest

echo "installing istio"
istioctl install  -y


