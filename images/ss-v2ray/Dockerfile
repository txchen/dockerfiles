FROM golang:alpine AS build

ENV V2RAY_PLUGIN_VERSION v1.2.0
ENV GO111MODULE on

RUN apk add --no-cache git \
    && cd / \
    && git clone https://github.com/shadowsocks/v2ray-plugin.git \
    && cd v2ray-plugin \
    && git checkout "$V2RAY_PLUGIN_VERSION" \
    && go get -d \
    && go build

FROM shadowsocks/shadowsocks-libev:latest

COPY --from=build /v2ray-plugin/v2ray-plugin /usr/bin

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD=
ENV METHOD aes-256-gcm
ENV TIMEOUT 300
ENV DNS_ADDRS 8.8.8.8,8.8.4.4
ENV ARGS=

CMD exec ss-server \
  -s $SERVER_ADDR \
  -p $SERVER_PORT \
  -k ${PASSWORD:-$(hostname)} \
  -m $METHOD \
  -t $TIMEOUT \
  -d $DNS_ADDRS \
  -u \
  --reuse-port \
  --no-delay \
  $ARGS