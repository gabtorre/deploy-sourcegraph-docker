#!/usr/bin/env bash
set -e

# Description: PostgreSQL database for code intelligence data.
#
# Disk: 128GB / persistent SSD
# Network: 1Gbps
# Liveness probe: 5432/TCP
# Ports exposed to other Sourcegraph services: 5432/TCP 9187/TCP
# Ports exposed to the public internet: none
#
VOLUME="$HOME/sourcegraph-docker/codeintel-db-disk"
./ensure-volume.sh $VOLUME 999
docker run --detach \
    --name=codeintel-db \
    --network=sourcegraph \
    --restart=always \
    --cpus=4 \
    --memory=2g \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v $VOLUME:/var/lib/postgresql/data/ \
<<<<<<< HEAD:deploy-codeintel-db.sh
    index.docker.io/sourcegraph/codeintel-db:3.30.4@sha256:af93cb2ccee65e5bb4db6b02061ff73f704275d19a9cfa7c1c9ed087fefa32fb
=======
    index.docker.io/sourcegraph/codeintel-db:3.31.2@sha256:308b7378e1653bbc55542943f492d80bc867e968f2a26cd1a44650f6daac1487
>>>>>>> v3.31.2:pure-docker/deploy-codeintel-db.sh

# Sourcegraph requires PostgreSQL 12+. Generally newer versions are better,
# but anything 12 and higher is supported.

echo "Deployed codeintel-db service"
