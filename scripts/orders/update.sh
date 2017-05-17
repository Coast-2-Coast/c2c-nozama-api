#!/bin/bash

API="http://localhost:4741"
URL_PATH="/orders"

ID="591cb37c38320900e80ea20b"
TOKEN="uzdnzysMJ+6PWiFGSVMcXvdnvDwqqIb8IQBozb3jSHI=--mVwTL+xlsp5bzlIrsd0ulF+NCZMYrp0c92+LzVX+Ifg="
PAID="true"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "order": {
      "paid": "'"${PAID}"'"
    }
  }'

echo
