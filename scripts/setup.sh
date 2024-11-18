curl -sfL https://get.k3s.io | sh -
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.crds.yaml # TODO to yaml
kubectl create secret generic cloudflare-api-token-secret --from-literal=api-token="$CLOUDFLARE_TOKEN" --namespace=cert-manager # TODO to yaml
flux bootstrap github --owner=${GITHUB_USER} --repository=platform --branch=main --personal --path=clusters/mcarcoba