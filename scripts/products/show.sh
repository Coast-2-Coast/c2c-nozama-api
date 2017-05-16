#!/bin/sh

API="http://localhost:4741"
URL_PATH="/products"

ID="591a4f73fa2bad79a4fd5cc5"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  # --header "Authorization: Token token=$TOKEN"

echo
