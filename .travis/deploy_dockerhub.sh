#!/bin/sh

MY_DOCKER_REPO="saptadip/flask_order_placement_app"

echo "Login to Docker Repo: $MY_DOCKER_REPO"
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi

echo "Building docker image"
docker build -f Dockerfile -t $MY_DOCKER_REPO:$TAG .
#docker build -f Dockerfile -t $MY_DOCKER_REPO:$TAG --build-arg DB_HOST=$DB_HOST --build-arg DB_USER=$DB_USER --build-arg DB_USERPWD=$DB_USERPWD --build-arg DB_NAME=$DB_NAME --no-cache .

echo "Pushing docker image to docker repository"
docker push $MY_DOCKER_REPO