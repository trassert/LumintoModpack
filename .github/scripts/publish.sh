#!/bin/bash
set -e

curl -X POST https://api.modrinth.com/v2/version \
  -H "Authorization: $MODRINTH_TOKEN" \
  -F "data=@modrinth.mod.json;type=application/json" \
  -F "file=@modpack.zip;filename=modpack.mrpack;type=application/x-modrinth-modpack"