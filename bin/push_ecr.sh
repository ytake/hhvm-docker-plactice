#!/bin/bash

ECR='aws url'
IMG_NAME_LIST=('vendor/name')

# BUILD
cd ../
/usr/local/bin/docker-compose --file docker-compose.build.yml build $@ || exit 1
cd -

for IMG_NAME in ${IMG_NAME_LIST[@]}
do
    # GET THE IMAGE VERSION
    VER=`docker images | grep $IMG_NAME | head -1 | awk '{print $2}'`

    # TAG
    echo "** Put the new tag for ECR"
    docker tag \
    	${IMG_NAME}:${VER} \
    	${ECR}/${IMG_NAME}:latest
    echo ""

    # AWS AUTHENTICATION
    echo "** Get a credential to connect to ECR"
    `aws ecr get-login --no-include-email`

    # PUSH
    echo "** Push the image to the ECR"
    # Latest指定
    docker push ${ECR}/${IMG_NAME}:latest
    echo ""
done
