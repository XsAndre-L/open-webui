# #!/bin/bash

# host_port=11434
# container_port=11434

# read -r -p "Do you want ollama in Docker with GPU support? (y/n): " use_gpu

# podman rm -f ollama || true
# podman pull --compress ollama/ollama:latest

# docker_args="-d -v ollama:/root/.ollama -p $host_port:$container_port --name ollama ollama/ollama"

# if [ "$use_gpu" = "y" ]; then
#     docker_args="--gpus=all $docker_args"
# fi

# docker run $docker_args

# docker image prune -f

#!/bin/bash

host_port=11434
container_port=11434

read -r -p "Do you want ollama in Podman with GPU support? (y/n): " use_gpu

# Remove any existing container named 'ollama'
podman rm -f ollama || true

# Pull the latest image (with compression)
podman pull --compress ollama/ollama:latest

# Define common arguments
podman_args="-d \
             --name ollama \
             -v ollama:/root/.ollama \
             -p $host_port:$container_port \
             ollama/ollama:latest"

# If GPU is requested, you might need extra flags.
# Note: Podman doesn’t directly support "--gpus=all" like Docker.
# You may require --privileged or the nvidia-container-toolkit for GPU pass-through.
if [ "$use_gpu" = "y" ]; then
    podman_args="--privileged $podman_args"
fi

# Run the container
podman run $podman_args

# Prune unused images
podman image prune -f
