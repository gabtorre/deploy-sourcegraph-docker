#!/usr/bin/env bash
set -e
source ./replicas.sh

# Description: Backend for text search operations.
#
# Disk: 128GB / non-persistent SSD
# Network: 100mbps
# Liveness probe: HTTP GET http://searcher:3181/healthz
# Ports exposed to other Sourcegraph services: 3181/TCP 6060/TCP
# Ports exposed to the public internet: none
#
VOLUME="$HOME/sourcegraph-docker/searcher-$1-disk"
./ensure-volume.sh $VOLUME 100
docker run --detach \
    --name=searcher-$1 \
    --network=sourcegraph \
    --restart=always \
    --cpus=2 \
    --memory=2g \
    -e GOMAXPROCS=2 \
    -e SRC_FRONTEND_INTERNAL=sourcegraph-frontend-internal:3090 \
    -e JAEGER_AGENT_HOST=jaeger \
    -v $VOLUME:/mnt/cache \
<<<<<<< HEAD:deploy-searcher.sh
    index.docker.io/sourcegraph/searcher:3.30.4@sha256:f92480312f69a93af1bec5e1f75995676d08752922c0ee28b48f88080cee752c
=======
    index.docker.io/sourcegraph/searcher:3.31.2@sha256:3fbcb7ab2beeb42c80bbf051df8f051a217d5442f78e39a8d122ad037349ddcc
>>>>>>> v3.31.2:pure-docker/deploy-searcher.sh

echo "Deployed searcher $1 service"
