#!/bin/bash

# $ EMAIL=c2c@wdi.com PASSWORD=triplets scripts/auth/sign-up.sh
# $ EMAIL=jim01 PASSWORD=00 scripts/auth/sign-up.sh

API="http://localhost:4741"
URL_PATH="/sign-up"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'

echo
