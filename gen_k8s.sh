#!/usr/bin/env bash

export WHITELIST_IP=0.0.0.0/0
export HOST_NAME=
export K8S_NAMESPACE=https-echo

envsubst < tmpl/nginx-ingress.yaml > nginx-ingress.yaml
envsubst < tmpl/deployment.yaml > deployment.yaml

export CLOUDFLARE_API_TOKEN=
export CERT_MANAGER_EMAIL=
export CERT_MANAGER_STAGING_SERVER=https://acme-staging-v02.api.letsencrypt.org/directory
export CERT_MANAGER_PROD_SERVER=https://acme-v02.api.letsencrypt.org/directory

envsubst < tmpl/cert-manager.yaml > cert-manager.yaml
envsubst < tmpl/cluster-issuer.yaml > cluster-issuer.yaml
