#!/bin/bash

# $ USERTOKEN=NgBBX8/9Gn0+D4mf8Fs8e2DJymj6u7OVB6bUVnKr7ms=--B5maFpA+PioHYb3qDShLkuedetHY2uqR6OH7fb8+0hU= TESTSTRIPETOKEN=tok_1AKuKACZ8793wTUSYyLhWEJh scripts/charges/create-charge.sh

# ID="58ba357cf61cbefc4823f8ac"
# USERTOKEN="NgBBX8/9Gn0+D4mf8Fs8e2DJymj6u7OVB6bUVnKr7ms=--B5maFpA+PioHYb3qDShLkuedetHY2uqR6OH7fb8+0hU="
# TESTSTRIPETOKEN="tok_1AKuKACZ8793wTUSYyLhWEJh"

API="http://localhost:4741"
URL_PATH="/charges"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${USERTOKEN}" \
  --data '{
    "charge": {
      "stripeToken": "'"${TESTSTRIPETOKEN}"'"
    }
  }'

echo
