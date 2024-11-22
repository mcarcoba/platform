kubectl create secret generic cloudflare-api-token-secret --from-literal=api-token="${CLOUDFLARE_TOKEN}" --namespace=cert-manager # TODO to yaml
kubectl create secret generic google-oidc-secret --namespace=traefik --from-literal=client-id="$(OAUTH_CLIENT_ID)" --from-literal=client-secret="$(OAUTH_CLIENT_SECRET)"
