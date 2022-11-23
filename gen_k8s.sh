#!/usr/bin/env bash

export WHITELIST_IP=0.0.0.0/0
export HOST_NAME=
export K8S_NAMESPACE=https-echo

envsubst < tmpl/nginx-ingress.yaml > nginx-ingress.yaml
envsubst < tmpl/deployment.yaml > deployment.yaml

export CLOUDFLARE_API_TOKEN=
export WILDCARD_CN=

envsubst < tmpl/reflector.yaml > reflector.yaml
envsubst < tmpl/cert-manager.yaml > cert-manager.yaml
envsubst < tmpl/cluster-issuer.yaml > cluster-issuer.yaml
envsubst < tmpl/https-secret.yaml > https-secret.yaml
