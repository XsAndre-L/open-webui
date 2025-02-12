#!/bin/bash

image_name="xai"
container_name="xai"
host_port=3000
container_port=8080

podman build -t "$image_name" .
podman stop "$container_name" &>/dev/null || true
podman rm "$container_name" &>/dev/null || true

podman run -d -p "$host_port":"$container_port" \
    --add-host=host.docker.internal:host-gateway \
    -v "${image_name}:/app/backend/data" \
    --name "$container_name" \
    --restart always \
    "$image_name"

podman image prune -f
