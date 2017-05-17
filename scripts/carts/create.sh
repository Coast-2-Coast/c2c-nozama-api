#!/bin/bash

API="http://localhost:4741"
URL_PATH="/carts"

TOKEN=H645f2dC92xHFyT6kNw/jNYu2afE7gn3HPeT2gP59+g=--x/yp/eOEizG6gpZA4Yga9t0IZnb/37jGRlXTXbc3mc4=
USERID="12344"
NAME="Umbrella"
PRICE="4000"
QUANTITY="2"
IMAGE="umbrella-url"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "userId": "'"${USERID}"'",
      "products": [ {"product": {
        "name": "'"${NAME}"'",
        "price": "'"${PRICE}"'",
        "quantity": "'"${QUANTITY}"'",
        "image": "'"${IMAGE}"'"
      }}]
    }
  }'

echo
