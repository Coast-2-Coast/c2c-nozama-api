#!/bin/bash

# $ ID=591b49bee095a321f752b2fe TOKEN=+2QGA4ndDETu0QzNNi86ThW6kwFCCoLoU+LdAWmlcsw=--fIBq4gVGRHBT3H6+2CanB7DjPRjjkDsOOGtDkOBGnQo= scripts/auth/sign-out.sh

API="http://localhost:4741"
URL_PATH="/sign-out"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
