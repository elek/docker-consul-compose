#!/bin/bash

DOCKER_FILE=$1
function reload(){
   echo "reload configuration"
   docker-compose -f $DOCKER_FILE up --remove-orphans -d
}
function stop(){
   docker-compose -f $DOCKER_FILE stop
}
trap stop EXIT  
trap reload SIGUSR1  

docker-compose -f $DOCKER_FILE pull
docker-compose -f $DOCKER_FILE up --remove-orphans -d


while :
do
   sleep 1
done
