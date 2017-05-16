#!/bin/bash

# $ ID=591b49bee095a321f752b2fe TOKEN=+2QGA4ndDETu0QzNNi86ThW6kwFCCoLoU+LdAWmlcsw=--fIBq4gVGRHBT3H6+2CanB7DjPRjjkDsOOGtDkOBGnQo= OLDPW=triplets NEWPW=123 scripts/auth/change-password.sh
# $ ID=591b49bee095a321f752b2fe TOKEN=+2QGA4ndDETu0QzNNi86ThW6kwFCCoLoU+LdAWmlcsw=--fIBq4gVGRHBT3H6+2CanB7DjPRjjkDsOOGtDkOBGnQo= OLDPW=123 NEWPW=triplets scripts/auth/change-password.sh

API="http://localhost:4741"
URL_PATH="/change-password"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
