# Docker

`podman-compose up`

`bun run build`

`podman run -d -p 3000:8080  --gpus=all --add-host=host.docker.internal:host-gateway   -v ./:/app   -v open-webui-data:/app/backend/data   --name open-webui   --rm   --env OLLAMA_BASE_URL=http://host.docker.internal:11434   open-webui:local`

## Build
`podman build -t open-webui:local .`

`podman run -d -p 3000:8080  --gpus=all --add-host=host.docker.internal:host-gateway   -v ./:/app   -v open-webui-data:/app/backend/data   --name open-webui   --env OLLAMA_BASE_URL=http://host.docker.internal:11434 --env CUDA_VISIBLE_DEVICES=0 --env OLLAMA_ENABLE_GPU=true  --rm open-webui:local`

note: docker run --log-level=debug -d ...

### AFTER HOSTING:::: to get it public from local network

ngrok http 3000

# Start Xai Locally

bun install

install go https://go.dev/dl/


bun run pyodide:fetch

## Start Frontend Backend

`bun setup:backend`

python -m venv .venv

### on windows
.venv/Scripts/activate


pip install -r backend/requirements.txt
python backend/open_webui/main.py
### also on windows
make sure path to backend is current backend path is correctly set in python
> export PYTHONPATH=$(cygpath -w $(pwd)/backend)


> echo $PYTHONPATH
C:\Dev\XtremeStudios\Xai\projects\Frontend\open-webui\backend


bun dev
