#!/usr/bin/env bash
set -e

# Description: Jaeger all-in-one instance
# (https://www.jaegertracing.io/docs/1.17/getting-started/#all-in-one) for distributed tracing.
#
# Disk: none
# Ports exposed to other Sourcegraph services: 5778/TCP 6831/UDP 6832/UDP 14250/TCP
# Ports exposed to the public internet: none
# Ports exposed to site admins only: 16686/HTTP
#
docker run --detach \
    --name=jaeger \
    --network=sourcegraph \
    --restart=always \
    --cpus="0.5" \
    --memory=512m \
    -p 0.0.0.0:16686:16686 \
    -p 0.0.0.0:14250:14250 \
    -p 0.0.0.0:5778:5778 \
    -p 0.0.0.0:6831:6831 \
    -p 0.0.0.0:6832:6832 \
<<<<<<< HEAD:deploy-jaeger.sh
    index.docker.io/sourcegraph/jaeger-all-in-one:3.30.4@sha256:3814a8664df421d7aa7a119311e0ca513d140d42630e27ae0461b8cb0ef0466c \
=======
    index.docker.io/sourcegraph/jaeger-all-in-one:3.31.2@sha256:3f1dd10446b8bbe534a1225b099a73e53a36667722988c9be516aeda9e5e3786 \
>>>>>>> v3.31.2:pure-docker/deploy-jaeger.sh
    --memory.max-traces=20000
