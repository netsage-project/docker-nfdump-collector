#!/usr/bin/env bash 
set -e

NFDUMP_VERSION=1.6.18

## Validates code and publish image for tagged branch
function integration_test {
    ./build.sh $NFDUMP_VERSION  
    
    if [ "$TRAVIS_PULL_REQUEST" = "false" ]; then 
        publish_image
    fi
}


## Publish image to our docker hub repository
function publish_image
{
    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
    echo docker push netsage/nfdump-collector:$NFDUMP_VERSION
    docker push netsage/nfdump-collector:$NFDUMP_VERSION
}


function cron_regression {
    echo "Cron integration not supported"

}

# Entry point
function main
{
    if [[ "$TRAVIS_EVENT_TYPE" = "cron" ]]; then 
        cron_regression
    else
        integration_test
    fi

}

main
