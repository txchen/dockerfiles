FROM alpine as build

ADD https://caddyserver.com/download/linux/amd64?license=personal&telemetry=off /opt/caddy.tar.gz
WORKDIR /opt/
RUN tar xf caddy.tar.gz


FROM gcr.io/distroless/base

LABEL maintainer "Tianxiang Chen <txchendev@gmail.com>"

COPY --from=build /opt/caddy /opt/caddy

ENTRYPOINT ["/opt/caddy"]
CMD ["--conf", "/etc/Caddyfile"]