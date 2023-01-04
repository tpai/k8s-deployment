# K8s Deployment

```
- depl/
  - {app_name}.yaml
- essential/
  - cert-manager.yaml      # cert-manager
  - cluster-issuer.yaml    # cloudflare dns & letsencrypt
  - https-secret.yaml      # wildcard certificate
  - reflector.yaml         # copy cert to specific namespace
  - env-resource.yaml      # namespace
  - nginx-ingress.yaml     # traffic entrance & network rules
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
