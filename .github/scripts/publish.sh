#!/bin/bash
set -e

METADATA=$(cat modrinth.mod.json)

BOUNDARY="----boundary$(date +%s)"
FILE="modpack.zip"

{
    echo "--$BOUNDARY"
    echo "Content-Disposition: form-data; name=\"data\""
    echo "Content-Type: application/json"
    echo ""
    echo "$METADATA"
    echo "--$BOUNDARY"
    echo "Content-Disposition: form-data; name=\"file\"; filename=\"modpack.mrpack\""
    echo "Content-Type: application/x-modrinth-modpack"
    echo ""
    cat "$FILE"
    echo ""
    echo "--$BOUNDARY--"
} > payload.tmp

curl -X POST https://api.modrinth.com/v2/version \
    -H "Authorization: $MODRINTH_TOKEN" \
    -H "Content-Type: multipart/form-data; boundary=$BOUNDARY" \
    --data-binary @payload.tmp

rm -f payload.tmp