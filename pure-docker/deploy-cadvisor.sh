#!/usr/bin/env bash
set -e
source ./replicas.sh

# Description: Publishes Prometheus metrics about Docker containers.
#
# Disk: none
# Network: 100mbps
# Liveness probe: none
# Ports exposed to other Sourcegraph services: 8080/TCP
# Ports exposed to the public internet: none
#
# Also add the following volume mount for container monitoring on MacOS:
#   --volume='/var/run/docker.sock:/var/run/docker.sock:ro' 
#
sudo docker run --detach \
    --name=cadvisor \
    --network=sourcegraph \
    --restart=always \
    --cpus=1 \
    --memory=1g \
    --volume=/:/rootfs:ro \
    --volume=/var/run:/var/run:ro \
    --volume=/sys:/sys:ro \
    --volume=/var/lib/docker/:/var/lib/docker:ro \
    --volume=/dev/disk/:/dev/disk:ro \
<<<<<<< HEAD:deploy-cadvisor.sh
    index.docker.io/sourcegraph/cadvisor:3.30.4@sha256:3e364516c21981bd55253766e6b12d8b1144b3c0da1efbbe88ed2841e7a07eb2 \
=======
    index.docker.io/sourcegraph/cadvisor:3.31.2@sha256:a872eabfc5c10b7f9185df76885786d8988aae6235ce8cf32287bc8c6c577a96 \
>>>>>>> v3.31.2:pure-docker/deploy-cadvisor.sh
    --port=8080

echo "Deployed cadvisor"
