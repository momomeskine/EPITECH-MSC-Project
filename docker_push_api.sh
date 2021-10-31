#!/bin/bash -e


SOURCE_IMAGE="${DOCKER_REPO_API}"
TARGET_IMAGE="${DOCKER_REPO_API}"
TARGET_IMAGE_LATEST="${TARGET_IMAGE}:latest"
TIMESTAMP=$(date '+%Y%m%d%H%M%S')
VERSION="${TIMESTAMP}-${TRAVIS_COMMIT}"

TARGET_IMAGE_VERSIONED="${TARGET_IMAGE}:${VERSION}"
docker login -u="${dockerid}" -p="${dockerpassword}"


# update latest version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_LATEST}
docker push ${TARGET_IMAGE_LATEST}

# push new version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_VERSIONED}
docker push ${TARGET_IMAGE_VERSIONED}