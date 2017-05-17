#!/bin/sh

API="http://localhost:4741"
URL_PATH="/orders"

ID="591cb37c38320900e80ea20b"
TOKEN="uzdnzysMJ+6PWiFGSVMcXvdnvDwqqIb8IQBozb3jSHI=--mVwTL+xlsp5bzlIrsd0ulF+NCZMYrp0c92+LzVX+Ifg="

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
