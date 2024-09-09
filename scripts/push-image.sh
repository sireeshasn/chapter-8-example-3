#!/bin/bash

#
# Pushes the Docker image to Azure Container Registry (ACR).
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number to tag the images with.
#
# Usage:
#
#       ./scripts/push-image.sh
#

# Treat unset variables as an error
set -u

# Ensure required environment variables are set
: "$CONTAINER_REGISTRY"
: "$VERSION"

# Push the Docker image to the registry
docker push $CONTAINER_REGISTRY/video-streaming:$VERSION

echo "Docker image pushed successfully!"
