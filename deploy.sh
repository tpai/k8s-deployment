#!/usr/bin/env bash

export CLOUDFLARE_API_TOKEN=
export ACME_EMAIL=
export WILDCARD_CN=

mkdir -p output

envsubst < essential/env-resource.yaml > output/env-resource.yaml

envsubst < essential/reflector.yaml > output/reflector.yaml
envsubst < essential/cert-manager.yaml > output/cert-manager.yaml
envsubst < essential/cluster-issuer.yaml > output/cluster-issuer.yaml
envsubst < essential/https-secret.yaml > output/https-secret.yaml


export OPENAI_API_KEY=
export TELEGRAM_TOKEN=
envsubst < depl/summary-gpt-bot.yaml > output/summary-gpt-bot.yaml

kubectl apply -f output

rm -rf output
