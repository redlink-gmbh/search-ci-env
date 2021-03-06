#!/usr/bin/env bash

# Docker CMD script

# SIGTERM-handler
sigterm_handler() {
  service mongodb stop
  exit 143; # 128 + 15 -- SIGTERM
}

# setup handlers on callback
# kill the last background process (tail) and execute the custom handler
trap 'kill ${!}; sigterm_handler' SIGTERM

# run mongodb
service mongodb start

# wait indefinetely
while true
do
  wait ${!}
done

