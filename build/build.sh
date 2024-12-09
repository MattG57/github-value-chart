#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Prompt the user for Docker credentials
echo "Enter your Docker Hub username:"
read -r DOCKER_USERNAME

echo "Enter your Docker Hub password:"
read -s DOCKER_PASSWORD  # Use -s to hide the password input

DOCKER_IMAGE="github-value"            # Docker image name
DOCKER_TAG="latest"                    # Docker image tag
REGISTRY="mgunter"        # Container registry (e.g., Docker Hub, AWS ECR)


# Build the Docker image
echo "Building Docker image..."
docker build -t $DOCKER_IMAGE:$DOCKER_TAG .

# Tag the Docker image for the registry
echo "Tagging Docker image..."
docker tag $DOCKER_IMAGE:$DOCKER_TAG $REGISTRY/$DOCKER_IMAGE:$DOCKER_TAG

# Log in to the container registry
echo "Logging into the container registry..."
# Replace USERNAME and PASSWORD with your credentials or use a secure method to manage them.
# echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin $REGISTRY
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
# Push the image to the container registry
echo "Pushing Docker image to the registry..."
docker push $REGISTRY/$DOCKER_IMAGE:$DOCKER_TAG

# Output success message
echo "Docker image successfully built and pushed to $REGISTRY/$DOCKER_IMAGE:$DOCKER_TAG"