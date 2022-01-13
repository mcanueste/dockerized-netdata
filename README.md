# Dockerized Netdata

This repository contains the configuration files for running
the Netdata monitoring tool in a docker container.

In order to enable docker container resource usage monitoring,
we need to pass the `docker` group id to the container.

The `docker` group id can be fetched using the following command
```shell
grep docker /etc/group | cut -d ":" -f 3
```

This id needs to be passed as an environment variable in the
`docker-compose.yml` file with the `PGID` key.

This repository also provides a `makefile` for automating this process,
which fetches the `docker` group id, and passes it as an environment variable
to the `netdata` container.

In order to start the `netdata` container with the `docker` group id, run the
following command
```shell
make run
```

## Opening the monitoring interface

Since this container is not accessible publicly with this configuration, you can
only view the monitoring interface via port forwarding.

You need to run the following command, which forwards the `19999` port of the
server you are running the `netdata` container on to your `localhost`.
```shell
ssh -NL 19999:localhost:19999 USER@SERVER_ADDRESS
```
where
- `USER` is your username on the server
- `SERVER_ADDRESS` is the ip address or the domain name of the server.
