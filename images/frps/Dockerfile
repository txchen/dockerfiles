FROM alpine as build

ARG frp_version

ADD https://github.com/fatedier/frp/releases/download/v${frp_version}/frp_${frp_version}_linux_amd64.tar.gz /opt/frp.tar.gz
WORKDIR /opt/
RUN tar xf frp.tar.gz
RUN mv /opt/frp_${frp_version}_linux_amd64/frps /opt/frps

FROM gcr.io/distroless/base

LABEL maintainer "Tianxiang Chen <txchendev@gmail.com>"

COPY --from=build /opt/frps /opt/frps

ENTRYPOINT ["/opt/frps"]
CMD ["-c", "/etc/frps.ini"]