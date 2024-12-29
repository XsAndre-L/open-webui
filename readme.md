# Docker

`podman-compose up`

`podman run -d -p 3000:8080  --gpus=all --add-host=host.docker.internal:host-gateway   -v ./:/app   -v open-webui-data:/app/backend/data   --name open-webui   --rm   --env OLLAMA_BASE_URL=http://host.docker.internal:11434   open-webui:local`

`podman run -d -p 3000:8080  --gpus=all --add-host=host.docker.internal:host-gateway   -v ./:/app   -v open-webui-data:/app/backend/data   --name open-webui   --rm   --env OLLAMA_BASE_URL=http://host.docker.internal:11434   open-webui:local`
