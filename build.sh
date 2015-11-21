#!/bin/bash

set -e

if [ -f /usr/bin/docker ]; then
    echo "No docker binary available"
    exit 1
fi

mkdir /tmp/grafana
cd /tmp/grafana

git clone https://github.com/grafana/grafana.git
cd grafana/docker/production

bash -x build.sh

docker tag grafana/grafana:develop larsla/grafana-armv7l
