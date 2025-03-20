#!/bin/bash

secret_key=$(yq "." /usr/local/etc/searxng/settings.yml | jq -r ".server.secret_key")
sed "s/changeit/$secret_key/g" config/settings.yml > /usr/local/etc/searxng/settings.yml
cp config/uwsgi.ini /usr/local/etc/searxng/
