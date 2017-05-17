#!/bin/bash

API="http://localhost:4741"
URL_PATH="/products"

ID="591a505fc150bf7a01584875"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  # --header "Authorization: Token token=${TOKEN}"

echo
