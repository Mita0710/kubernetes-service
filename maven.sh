#!/bin/bash
echo "***************************"
echo "******* Building jar ******"
echo "***************************"
PROJECT=$1
IMAGE_TAG=$2
echo "===Project dir = $PROJECT==="
echo "===Image tag = $IMAGE_TAG==="
docker run --rm  -v  $(pwd)/$PROJECT:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine mvn -DskipTests clean package \
 && cd $PROJECT/ && docker image build -t $IMAGE_TAG .

