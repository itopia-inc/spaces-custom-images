# This defines a custom space for the itopia DevRel & Product teams
# to develop & maintain container images for itopia Spaces.
# See https://github.com/itopia-inc/spaces-base-images
# and https://github.com/itopia-inc/spaces-custom-images
# and https://github.com/itopia-inc/spaces-images

# syntax=docker/dockerfile:1
FROM ghcr.io/itopia-inc/spaces-images/spaces-ubuntu-vscode:focal

# Install Docker extension for VS Code
# This adds syntax checking (and more) for this space's many Dockerfiles.
RUN code --install-extension ms-azuretools.vscode-docker
