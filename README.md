# AKS Demo

## Prerequisites

Edit environment variables in `gen_k8s.sh`.

Generate Kubernetes YAML files.

```sh
./gen_k8s.sh
```

## Install https-echo w/ nginx-ingress

```sh
kubectl apply -f deployment.yaml
kubectl apply -f nginx-ingress.yaml
```

Visit `http://{ip}/metrics` to verify prometheus.

Visit `https://{domain}` to verify https-echo.

## Install cert-manager

```sh
kubectl apply -f cert-manager.yaml
kubectl apply -f cluster-issuer.yaml
```

Disable staging mode, retrieve real certificate from ACME.

```diff
kind: Ingress
metadata:
  ...
  annotations:
-   cert-manager.io/cluster-issuer: "letsencrypt-staging"
+   cert-manager.io/cluster-issuer: "letsencrypt-prod"
```

## Create nginx-ingress dashboard

Edit `prometheus.yml` config for target IP.

Launch Prometheus and Grafana services.

```sh
cd prom; docker-compose up -d
```

In Grafana, add Prometheus data source.

```
HTTP.URL http://kubernetes.docker.internal:9090
```

Import [nginx-ingress dashboard](https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/grafana/dashboards/nginx.json)
