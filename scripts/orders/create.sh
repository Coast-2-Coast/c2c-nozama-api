#!/bin/bash

API="http://localhost:4741"
URL_PATH="/orders"

OWNER="591cb51fa8be470179e41ef2"
TOKEN="YfrknlJCT/MQ2yIGOb7No1HRnGQeAGSOnQf7B0zQ728=--V8mOMFFYOuL1TVVND9wTX6U/YQHVVhZUweigdSvU5Sg="
DATE="2017-05-06"
ITEMS="{name: 'apple', price: 100, qty: 2},{name: 'orange', price: 200, qty: 1},{name: 'banana', price: 300, qty: 1}"
TOTAL="600"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "order": {
      "orderDate": "'"${DATE}"'",
      "items": "'"${ITEMS}"'",
      "total": "'"${TOTAL}"'",
      "_owner": "'"${OWNER}"'"
    }
  }'

echo
