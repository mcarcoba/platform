kubectl get internal-service-cert-secret -n cert-manager -o jsonpath='{.data.tls\.crt}' | base64 -d > client.crt
kubectl get internal-service-cert-secret -n cert-manager -o jsonpath='{.data.tls\.key}' | base64 -d > client.key
kubectl get internal-service-cert-secret -n cert-manager -o jsonpath='{.data.ca\.crt}' | base64 -d > ca.crt
