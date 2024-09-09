#!/bin/bash

#
# Builds a Docker image.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number to tag the images with.
#
# Usage:
#
#       ./scripts/build-image.sh
#

# Treat unset variables as an error
set -u

# Ensure required environment variables are set
: "$CONTAINER_REGISTRY"
: "$VERSION"

# Build the Docker image, and specify the current directory (.) as the build context
docker buildx build -t $CONTAINER_REGISTRY/video-streaming:$VERSION --file ./Dockerfile-prod .

echo "Docker image built successfully!"
