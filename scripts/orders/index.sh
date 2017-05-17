#!/bin/sh

API="http://localhost:4741"
URL_PATH="/orders"

TOKEN="YfrknlJCT/MQ2yIGOb7No1HRnGQeAGSOnQf7B0zQ728=--V8mOMFFYOuL1TVVND9wTX6U/YQHVVhZUweigdSvU5Sg="

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
