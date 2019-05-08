#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DOCKER_REPO_BASE="latex-docker"
#IMG_TAG=alpine-minimal-latest

#docker build -f Dockerfile.alpine-minimal -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
#docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}

##
IMG_TAG=debian-latest

docker build -f Dockerfile.debian -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}

##
IMG_TAG=debian-minimal-latest

docker build -f Dockerfile.debian-minimal -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}

##
#IMG_TAG=debian-minplus-latest

#docker build -f Dockerfile.debian-minplus -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
#docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}

## Use Docker's infrastructure to build this image:
#IMG_TAG=alpine-minplus-latest
#curl -X POST -L https://cloud.docker.com/api/build/v1/source/991cd1c4-db8e-42a8-b6ba-a0a1a0c15457/trigger/f6dab3f3-fca2-4dc6-b0d4-7258800b3ffe/call/

#docker build -f Dockerfile.alpine-minplus -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
#docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}
