#!/bin/sh
echo "Installing Heroku toolbelt"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo "Installing heroku-container-registry plugin"
heroku plugins:install heroku-container-registry

echo "Login to Heroku Docker Registry"
docker login -e _ -u _ --password=$HEROKU_API_KEY registry.heroku.com

echo "Pushing application docker container to Heroku"
heroku container:push web --app $HEROKU_APP_NAME

echo "Deployment to Heroku end"