#!/usr/bin/env bash
set -e
source ./replicas.sh

# Rename the old ~/sourcegraph-docker/zoekt-shared-disk -> ~/sourcegraph-docker/zoekt-$1-shared-disk
# if it exists. This ensures we don't have to rebuild the search index from scratch.
if [ -e ~/sourcegraph-docker/zoekt-shared-disk ] 
then mv ~/sourcegraph-docker/zoekt-shared-disk ~/sourcegraph-docker/zoekt-$1-shared-disk
fi

# Description: Backend for indexed text search operations.
#
# Disk: 200GB / persistent SSD
# Network: 100mbps
# Liveness probe: n/a
# Ports exposed to other Sourcegraph services: 6072/TCP
# Ports exposed to the public internet: none
#
VOLUME="$HOME/sourcegraph-docker/zoekt-$1-shared-disk"
./ensure-volume.sh $VOLUME 100
docker run --detach \
    --name=zoekt-indexserver-$1 \
    --hostname=zoekt-indexserver-$1 \
    --network=sourcegraph \
    --restart=always \
    --cpus=8 \
    --memory=16g \
    -e GOMAXPROCS=8 \
    -e HOSTNAME=zoekt-webserver-$1:6070 \
    -e SRC_FRONTEND_INTERNAL=http://sourcegraph-frontend-internal:3090 \
    -v $VOLUME:/data/index \
    index.docker.io/sourcegraph/search-indexer:3.32.0@sha256:c0eed47bb3bdaff187501d7f6f0336ab407a2bdc8581fe8163ca973dde4f5d76

echo "Deployed zoekt-indexserver $1 service"
