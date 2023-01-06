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

## Create nginx-ingress dashboard in Grafana

1. Specify `target_ip` in `prometheus.yaml`
1. Launch Prometheus and Grafana
    ```sh
    cd prom; docker-compose up -d
    ```
1. In Grafana add Prometheus data source
    ```
    HTTP
    URL http://kubernetes.docker.internal:9090
    ```
1. Import [nginx-ingress](https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/grafana/dashboards/nginx.json) dashboard
