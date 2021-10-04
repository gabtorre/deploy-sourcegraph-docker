#!/usr/bin/env bash
set -e

# Description: Redis for storing short-lived caches.
#
# Disk: 128GB / persistent SSD
# Network: 100mbps
# Liveness probe: 6379/TCP
# Ports exposed to other Sourcegraph services: 6379/TCP 9121/TCP
# Ports exposed to the public internet: none
#
VOLUME="$HOME/sourcegraph-docker/redis-cache-disk"
./ensure-volume.sh $VOLUME 999
docker run --detach \
    --name=redis-cache \
    --network=sourcegraph \
    --restart=always \
    --cpus=1 \
    --memory=6g \
    -v $VOLUME:/redis-data \
<<<<<<< HEAD:deploy-redis-cache.sh
    index.docker.io/sourcegraph/redis-cache:3.30.4@sha256:35245d84f0d154d12501ea4b997fa21913939cc4ce7c4de288b44d1d7e50624c
=======
    index.docker.io/sourcegraph/redis-cache:3.31.2@sha256:000293b179b679b43827e0200d74572d4d86a8b91490600167b16667cd4bf343
>>>>>>> v3.31.2:pure-docker/deploy-redis-cache.sh

echo "Deployed redis-cache service"
