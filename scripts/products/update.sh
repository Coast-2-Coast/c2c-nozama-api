#!/bin/bash

API="http://localhost:4741"
URL_PATH="/products"

ID="591a4f73fa2bad79a4fd5cc5"
PRICE="100"


curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "product": {
      "price": "'"${PRICE}"'"
    }
  }'

echo
