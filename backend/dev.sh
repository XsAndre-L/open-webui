# PORT="${PORT:-8080}"
# uvicorn open_webui.main:app --port $PORT --host 0.0.0.0 --forwarded-allow-ips '*' --reload

#!/bin/bash

set -x
PORT="${PORT:-8080}"
echo "Running on port $PORT"
uvicorn open_webui.main:app --port $PORT --host 0.0.0.0 --forwarded-allow-ips '*' --reload
