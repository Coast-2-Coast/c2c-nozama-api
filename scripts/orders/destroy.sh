#!/bin/bash

API="http://localhost:4741"
URL_PATH="/orders"

ID="591caf626f4278ff4de64a73"
TOKEN="uzdnzysMJ+6PWiFGSVMcXvdnvDwqqIb8IQBozb3jSHI=--mVwTL+xlsp5bzlIrsd0ulF+NCZMYrp0c92+LzVX+Ifg="

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
