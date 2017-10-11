#!/usr/bin/env sh

eval "$(jq -r '@sh "PROJECT=\(.project)"')"

# Check if logged in to LastPass
if ! lpass status | grep -q "Logged in as " ; then
    echo " " >&2
    echo " " >&2
    echo "Please login to LastPass CLI" >&2
    echo "EXAMPLE" >&2
    echo "      $ lpass login username@example.com" >&2
    exit 1
fi

LPASS_AWS_ACCESS_KEY=$(lpass show "$PROJECT/AWS Credentials" --access_key)
LPASS_AWS_SECRET_KEY=$(lpass show "$PROJECT/AWS Credentials" --secret_key)

jq -n --arg access_key "$LPASS_AWS_ACCESS_KEY" --arg secret_key "$LPASS_AWS_SECRET_KEY" '{"access_key":$access_key, "secret_key":$secret_key}'
