# Install application and Gateway

1. run ./app-setup.sh
2. Ensure you have valid response by running the following code 

```sh
export INGRESS_NAME=istio-ingressgateway
export INGRESS_NS=istio-system

export INGRESS_HOST=$(kubectl -n "$INGRESS_NS" get service "$INGRESS_NAME" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n "$INGRESS_NS" get service "$INGRESS_NAME" -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')

curl -s -I -HHost:httpbin.example.com "http://$INGRESS_HOST:$INGRESS_PORT/status/200"
```

you should see a 200-OK response