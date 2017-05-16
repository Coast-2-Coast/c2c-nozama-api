#!/bin/bash

API="http://localhost:4741"
URL_PATH="/products"

NAME="testName"
PRICE="3"
INVENTORY="0"
IMAGE="imageURL"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "product": {
      "name": "'"${NAME}"'",
      "price": "'"${PRICE}"'",
      "inventory": "'"${INVENTORY}"'",
      "image": "'"${IMAGE}"'"
    }
  }'

echo
