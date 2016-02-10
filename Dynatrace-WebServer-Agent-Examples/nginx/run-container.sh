#!/bin/bash
echo "Starting NGINX - Example"
docker run --rm \
  --name nginx-example \
  --volumes-from dtwsagent \
  --link dtwsagent \
  --ipc container:dtwsagent \
  --publish-all \
  nginx \
  sh -c "(sleep 1 && \${DTWSAGENT_ENV_DT}/attach-to-wsagent-master.sh &) && \
         LD_PRELOAD=\${DTWSAGENT_ENV_LIB64} nginx -g 'daemon off;'"
