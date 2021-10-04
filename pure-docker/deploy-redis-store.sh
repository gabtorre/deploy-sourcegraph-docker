#!/usr/bin/env bash
set -e

# Description: Redis for storing semi-persistent data like user sessions.
#
# Disk: 128GB / persistent SSD
# Network: 100mbps
# Liveness probe: 6379/TCP
# Ports exposed to other Sourcegraph services: 6379/TCP 9121/TCP
# Ports exposed to the public internet: none
#
VOLUME="$HOME/sourcegraph-docker/redis-store-disk"
./ensure-volume.sh $VOLUME 999
docker run --detach \
    --name=redis-store \
    --network=sourcegraph \
    --restart=always \
    --cpus=1 \
    --memory=6g \
    -v $VOLUME:/redis-data \
<<<<<<< HEAD:deploy-redis-store.sh
    index.docker.io/sourcegraph/redis-store:3.30.4@sha256:5e9fec6f4f9801fcd012a5eb4d35d1f50e9e7c6aad2733790698ab28b8378930
=======
    index.docker.io/sourcegraph/redis-store:3.31.2@sha256:78c69edb86ce5a9bb320fb69356190344ee0bbe190e17e9d4f538689ee0891fd
>>>>>>> v3.31.2:pure-docker/deploy-redis-store.sh

echo "Deployed redis-store service"
