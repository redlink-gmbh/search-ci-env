#!/bin/bash
# Docker CMD script

# SIGTERM-handler
sigterm_handler() {]
    service mongodb stop
    exit 143; # 128 + 15 -- SIGTERM
}

# setup handlers on callback
# kill the last background process (tail) and execute the custom handler
trap 'kill ${!}; sigterm_handler' SIGTERM

service mongodb start
$BASEPATH/run.sh "${ARGS[@]}" &

# wait indefinetely
while true; do
#    [ -f "${DATA_DIR}/logs/main.log" ] && tail -f "${DATA_DIR}/logs/main.log" || sleep 5s
    sleep 5s
done