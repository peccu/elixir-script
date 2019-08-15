#!/bin/bash
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}"); pwd)
DIRNAME=$(dirname "${BASH_SOURCE:-$0}")
elixir=$SCRIPT_DIR/elixir.sh
$elixir sh -c "MIX_EXS=$DIRNAME/mix.exs mix run $DIRNAME/main.exs $@"
