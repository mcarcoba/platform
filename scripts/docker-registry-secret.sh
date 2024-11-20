# Load environment variables from the .env file
source ./env.sh

# Check if the necessary environment variables are loaded
if [ -z "$DOCKER_REGISTRY_SERVER" ] || [ -z "$DOCKER_USERNAME" ] || [ -z "$DOCKER_PASSWORD" ] || [ -z "$DOCKER_EMAIL" ] || [ -z "$SECRET_NAME" ]; then
  echo "Error: Some required environment variables are missing."
  exit 1
fi

# Create the Docker secret for the private registry
echo "Creating Docker secret for the private registry..."
kubectl create secret docker-registry dockerhub-registry \
  --docker-server=$DOCKER_REGISTRY_SERVER \
  --docker-username=$DOCKER_USERNAME \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=$DOCKER_EMAIL

echo "Secret dockerhub-registry created in the namespace default."

# Optionally: Set the secret as the default for the namespace
read -p "Do you want to set this secret as the default ? (y/n): " SET_DEFAULT
if [[ "$SET_DEFAULT" == "y" ]]; then
  echo "Setting the secret as default for the namespace default..."
  kubectl patch serviceaccount default \
    -p "{\"imagePullSecrets\": [{\"name\": \"dockerhub-registry\"}]}" \
    --namespace default
  echo "Default configuration completed."
else
  echo "Exiting without setting as default."
fi

echo "Script completed. You can now use the secret dockerhub-registry to access private images."