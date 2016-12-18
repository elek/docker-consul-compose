#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKDIR=$DIR/c
export CONSUL_COMPOSE_PATH=${CONSUL_COMPOSE_PATH:-/compose/docker-compose.yaml}
mkdir -p $WORKDIR
consul-template -template=<(echo '{{key (env "CONSUL_COMPOSE_PATH")}}'):$WORKDIR/docker-compose.yaml -exec "$DIR/composer.sh $WORKDIR/docker-compose.yaml"
