# aps-kong-gateway

## Setting up your Development Environment

```
PATH=$PATH:~/.local/bin
git clone https://github.com/Kong/kong-pongo.git
git checkout 2.5.0
mkdir -p ~/.local/bin
ln -s $(realpath kong-pongo/pongo.sh) ~/.local/bin/pongo
```

```
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo run
```

## Testing

```
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo up
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo shell
kms
curl -v http://localhost:8001/runtime-groups -X POST -d name=testrg -d features=a -d features=b
curl -v http://localhost:8001/runtime-groups/testrg

COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo logs

COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo down
```
