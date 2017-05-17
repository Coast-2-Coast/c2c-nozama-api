#!/bin/bash

API="http://localhost:4741"
URL_PATH="/orders"

ID="591cc7ad70522409a42c48ba"
TOKEN="YfrknlJCT/MQ2yIGOb7No1HRnGQeAGSOnQf7B0zQ728=--V8mOMFFYOuL1TVVND9wTX6U/YQHVVhZUweigdSvU5Sg="
RATING="5"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "order": {
      "rating": "'"${RATING}"'"
    }
  }'

echo
