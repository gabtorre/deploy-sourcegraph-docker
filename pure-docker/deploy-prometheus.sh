#!/usr/bin/env bash
set -e

# Description: Prometheus collects metrics and aggregates them into graphs.
#
# Disk: 200GB / persistent SSD
# Network: 100mbps
# Liveness probe: n/a
# Ports exposed to other Sourcegraph services: none
# Ports exposed to the public internet: none (HTTP 9090 should be exposed to admins only)
#
VOLUME="$HOME/sourcegraph-docker/prometheus-v2-disk"
./ensure-volume.sh $VOLUME 100
docker run --detach \
    --name=prometheus \
    --network=sourcegraph \
    --restart=always \
    --cpus=4 \
    --memory=8g \
    -p 0.0.0.0:9090:9090 \
    -v $VOLUME:/prometheus \
    -v $(pwd)/../prometheus:/sg_prometheus_add_ons \
    -e SRC_FRONTEND_INTERNAL=sourcegraph-frontend-internal:3090 \
<<<<<<< HEAD:deploy-prometheus.sh
    index.docker.io/sourcegraph/prometheus:3.30.4@sha256:50d543baf7335814e543706a725042ba4660dd5a48507b58ac6337458e86b74e
=======
    index.docker.io/sourcegraph/prometheus:3.31.2@sha256:93a2e545aefbf086e7f3669fdadd3781456b37cf591513ebd6f090595031d378
>>>>>>> v3.31.2:pure-docker/deploy-prometheus.sh
