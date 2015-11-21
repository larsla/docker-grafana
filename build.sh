#!/bin/bash

set -e

if [ -f /usr/bin/docker ]; then
    echo "No docker binary available"
    exit 1
fi

mkdir /grafana
cd /grafana

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

go get github.com/grafana/grafana
cd $GOPATH/src/github.com/grafana/grafana
go run build.go setup
godep restore
go build .

npm install
npm install -g grunt-cli
grunt


#docker tag grafana/grafana:develop larsla/grafana-armv7l
