#!/usr/bin/env sh

eval "$(jq -r '@sh "PROJECT=\(.project)"')"

LPASS_AWS_ACCESS_KEY=$(lpass show "$PROJECT/AWS Credentials" --access_key)
LPASS_AWS_SECRET_KEY=$(lpass show "$PROJECT/AWS Credentials" --secret_key)

jq -n --arg access_key "$LPASS_AWS_ACCESS_KEY" --arg secret_key "$LPASS_AWS_SECRET_KEY" '{"access_key":$access_key, "secret_key":$secret_key}'
