#!/bin/bash
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}"); pwd)
cd $SCRIPT_DIR
elixir=./elixir.sh
$elixir sh -c "mix deps.get && mix deps.compile"
