curl -sfL https://get.k3s.io | sh -
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.crds.yaml # TODO to yaml
flux bootstrap github --owner=${GITHUB_USER} --repository=platform --branch=main --personal --path=clusters/mcarcoba

# source secrets.sh