Simple docker image to download a docker-compose file from consul and and start up the containers defined in the file.

It also listens to the changes and run docker-compose up on changes.

Environment variables to configre:

    * ``CONSUL_COMPOSE_PATH``: the key for the docker-compose file in the consul server
    * `` CONSUL_SERVER``: the host and port of the consul server

Example run:

```
docker run --network=host -it -v /var/run/docker.sock:/var/run/docker.sock elek/consul-compose
```
