#!/bin/bash -e

service unit start

curl \
    -X PUT \
    -d @/etc/unit/config.json \
    --unix-socket /run/control.unit.sock http://localhost/

exec "$@"
