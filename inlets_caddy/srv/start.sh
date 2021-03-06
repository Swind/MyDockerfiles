#!/bin/sh

# Starting inlets
echo "Starting inlets ..."
if [ -z "${TOKEN}" ]; then
  TOKEN=$(head -c 16 /dev/urandom | shasum | cut -d" " -f1)
fi

echo "TOKEN=${TOKEN}"
inlets server --port=8090 --token="$TOKEN"&

# Starting caddy
echo "Starting caddy ..."
echo "Domain name is ${DOMAIN_NAME}"

echo "Caddyfile"
cat /srv/Caddyfile
caddy run
