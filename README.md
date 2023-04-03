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
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo build --force
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo up
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo shell
kms
curl -v http://localhost:8001/runtime-groups -X POST -d name=testrg -d namespaces=a -d namespaces=b
curl -v http://localhost:8001/runtime-groups/testrg

COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo logs

COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 KONG_VERSION=2.8.3 pongo down

curl -v http://127.0.0.1:8001/runtime-groups -X POST -d @sample.json -H "Content-Type: application/json"
curl -v http://127.0.0.1:8001/runtime-groups/sample-runtime-group -X PUT -d @sample.json -H "Content-Type: application/json"


```
