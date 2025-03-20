#!/bin/bash

set -e

secret_key=$(yq "." /usr/local/etc/searxng/settings.yml | jq -r ".server.secret_key")
sudo sed "s/changeit/$secret_key/g" config/settings.yml > /usr/local/etc/searxng/settings.yml
sudo cp config/uwsgi.ini /usr/local/etc/searxng/

kubectl -nsearxng rollout restart deploy searxng
