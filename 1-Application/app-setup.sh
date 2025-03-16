#!/bin/sh

echo "install sample web app"
kubectl label namespace default istio-injection=enabled
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.24/samples/httpbin/httpbin.yaml

echo "install Istio Gateway and virutal service"
kubectl apply -f gateway.yaml

echo "install virtual service for the httpbin service"
kubectl apply -f virtual-service.yaml

echo "Determine Ingress Host and Port"
export INGRESS_NAME=istio-ingressgateway
export INGRESS_NS=istio-system

export INGRESS_HOST=$(kubectl -n "$INGRESS_NS" get service "$INGRESS_NAME" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n "$INGRESS_NS" get service "$INGRESS_NAME" -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')

echo "*****************"
echo "Start the kind cloud provider by running ./cloud-provider-kind"
echo "*****************"
read -p "Your Kind-Cloud Provider runs ? (Y/N) ? " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  echo "Kind-Cloud Provider is running"
else
  echo "Please start the Kind-Cloud Provider and try again."
  exit 1
fi

echo "sending request to $INGRESS_HOST:$INGRESS_PORT"
curl -s -I -HHost:httpbin.example.com "http://$INGRESS_HOST:$INGRESS_PORT/status/200"
