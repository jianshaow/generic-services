#!/bin/bash

set -e

secret_key=$(yq "." /usr/local/etc/searxng/settings.yml | jq -r ".server.secret_key")
sed "s/changeit/$secret_key/g" config/settings.yml | sudo tee /usr/local/etc/searxng/settings.yml
sudo cp config/uwsgi.ini /usr/local/etc/searxng/

kubectl -nsearxng rollout restart deploy searxng
