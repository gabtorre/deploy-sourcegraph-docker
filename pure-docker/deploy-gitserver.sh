#!/usr/bin/env bash
set -e
source ./replicas.sh

# Description: Stores clones of repositories to perform Git operations.
#
# Disk: 200GB / persistent SSD
# Network: 100mbps
# Liveness probe: n/a
# Ports exposed to other Sourcegraph services: 3178/TCP 6060/TCP
# Ports exposed to the public internet: none
#
VOLUME="$HOME/sourcegraph-docker/gitserver-$1-disk"
./ensure-volume.sh $VOLUME 100
docker run --detach \
    --name=gitserver-$1 \
    --network=sourcegraph \
    --restart=always \
    --cpus=4 \
    --memory=8g \
    --hostname=gitserver-$1 \
    -e GOMAXPROCS=4 \
    -e SRC_FRONTEND_INTERNAL=sourcegraph-frontend-internal:3090 \
    -e JAEGER_AGENT_HOST=jaeger \
    -v $VOLUME:/data/repos \
<<<<<<< HEAD:deploy-gitserver.sh
    index.docker.io/sourcegraph/gitserver:3.30.4@sha256:739f9a21d2b089b6e7fdcfc00281f03d8ff9fe66a09832660210c8bcb9786a43
=======
    index.docker.io/sourcegraph/gitserver:3.31.2@sha256:37f2915ec2b03ed350e3a3a54d6121ab9655777e3c9dd6aef14775c5ed35ccf2
>>>>>>> v3.31.2:pure-docker/deploy-gitserver.sh

echo "Deployed gitserver $1 service"
