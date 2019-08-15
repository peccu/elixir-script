#!/bin/bash
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}"); pwd)
cd $SCRIPT_DIR
elixir=./elixir.sh
$elixir mix deps.get && elixir mix deps.compile
