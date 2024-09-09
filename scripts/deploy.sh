#!/bin/bash

#
# Deploys the Node.js microservice to Kubernetes.
#
# Assumes the image has already been built and published to the container registry.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number of the image to deploy.
#
# Usage:
#
#   ./scripts/deploy.sh
#

# Exit script if any command fails or if an unset variable is used
set -u # or set -o nounset

# Ensure required environment variables are set
: "${CONTAINER_REGISTRY:?Environment variable CONTAINER_REGISTRY must be set}"
: "${VERSION:?Environment variable VERSION must be set}"

# Deploy using kubectl and envsubst to replace variables in the YAML file
envsubst < ./scripts/kubernetes/deploy.yaml | kubectl apply -f -

echo "Deployment successful!"
