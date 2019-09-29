#!/usr/bin/env bash

latest_release_version() {
  curl --silent "https://api.github.com/repos/fatedier/frp/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/' |
    sed -E 's/^v//'
}

frp_version=$(latest_release_version)

echo latest frp version = $frp_version

docker build \
  --tag "txchen/frps:$frp_version" \
  --tag "txchen/frps:latest" \
  --build-arg frp_version="$frp_version" \
  --compress \
  .
