# Crear el secreto de Kubernetes para almacenar el certificado y la clave de la CA
kubectl create secret tls mcarcoba-ca-cert-secret --cert=ca.crt --key=ca.key --namespace cert-manager

curl -sfL https://get.k3s.io | sh -
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.crds.yaml # TODO to yaml
flux bootstrap github --owner=${GITHUB_USER} --repository=platform --branch=main --personal --path=clusters/mcarcoba

# source secrets.sh
