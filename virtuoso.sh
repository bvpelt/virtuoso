#!/bin/bash
VIRTUOSO_EXECUTABLE=/usr/bin/virtuoso-t
VIRTUOSO_ARGS=-df

_term() {
  echo "Caught SIGTERM signal!"
  kill -TERM "$child" 2>/dev/null
}
trap _term SIGTERM

$VIRTUOSO_EXECUTABLE $VIRTUOSO_ARGS &
PID=$!

wait $PID
