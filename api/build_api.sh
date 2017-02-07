#!/usr/bin/env bash
set -ex
echo "----------------------------------build docker image"
docker build -t api_ruby -f ./api/Dockerfile .
echo "----------------------------------tag image"
docker tag api_ruby ihakula/api-ruby:api_ruby
echo "----------------------------------aws login"
docker login --username $DOCKER_USER --password $DOCKER_PASS
echo "----------------------------------push to ecr"
docker push ihakula/api-ruby:api_ruby