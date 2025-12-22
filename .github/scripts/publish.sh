#!/bin/bash
set -e

echo "$(cat modrinth.mod.json)" > metadata.json

curl -X POST https://api.modrinth.com/v2/version \
    -H "Authorization: $MODRINTH_TOKEN" \
    -F "data=<metadata.json;type=application/json" \
    -F "file=@modpack.zip;filename=modpack.mrpack;type=application/x-modrinth-modpack"