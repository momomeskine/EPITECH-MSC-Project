#!/bin/bash -e


# this is most likely namespaced repo name like myorg/veryimportantimage
SOURCE_IMAGE="${DOCKER_REPO_API}"
# using it as there will be 2 versions published
TARGET_IMAGE="${DOCKER_REPO_API}"
# lets make sure we always have access to latest image
TARGET_IMAGE_LATEST="${TARGET_IMAGE}:latest"
TIMESTAMP=$(date '+%Y%m%d%H%M%S')
# using datetime as part of a version for versioned image
VERSION="${TIMESTAMP}-${TRAVIS_COMMIT}"
# using specific version as well
# it is useful if you want to reference this particular version
# in additional commands like deployment of new Elasticbeanstalk version
TARGET_IMAGE_VERSIONED="${TARGET_IMAGE}:${VERSION}"
docker login -u="${dockerid}" -p="${dockerpassword}"


# update latest version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_LATEST}
docker push ${TARGET_IMAGE_LATEST}

# push new version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_VERSIONED}
docker push ${TARGET_IMAGE_VERSIONED}