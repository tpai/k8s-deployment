#!/usr/bin/env bash

export CLOUDFLARE_API_TOKEN=
export ACME_EMAIL=
export WILDCARD_CN=

mkdir -p output

envsubst < essential/env-resource.yaml > output/env-resource.yaml
envsubst < essential/nginx-ingress.yaml > output/nginx-ingress.yaml
envsubst < essential/metrics-ingress.yaml > output/metrics-ingress.yaml

envsubst < essential/reflector.yaml > output/reflector.yaml
envsubst < essential/cert-manager.yaml > output/cert-manager.yaml
envsubst < essential/cluster-issuer.yaml > output/cluster-issuer.yaml
envsubst < essential/https-secret.yaml > output/https-secret.yaml

envsubst < depl/idiomthon.yaml > output/idiomthon.yaml
envsubst < depl/keyboard-generator.yaml > output/keyboard-generator.yaml
envsubst < depl/throw-and-hit.yaml > output/throw-and-hit.yaml
envsubst < depl/turtle-soup.yaml > output/turtle-soup.yaml

export OPENAI_API_KEY=
export TELEGRAM_TOKEN=

envsubst < depl/lsa-qa-bot.yaml > output/lsa-qa-bot.yaml

kubectl apply -f output

rm -rf output
