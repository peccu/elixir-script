#!/bin/bash
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}"); pwd)
if readlink $BASH_SOURCE >/dev/null
then
    SCRIPT_DIR=$(dirname "$SCRIPT_DIR/$(readlink $BASH_SOURCE)")
fi
docker-compose -f $SCRIPT_DIR/docker-compose.yml run --rm -u $UID -e "COLUMNS=$(tput cols)" -e "LINES=$(tput lines)" tool "$@"
