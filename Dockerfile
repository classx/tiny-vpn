FROM alpine:latest

LABEL author="classx@gmail.com"
LABEL description="Alpine based, very simple openvpn server"
LABEL version="0.0.1"

RUN apk update && \
    apk add openvpn socat curl openssl && \
    rm -rf /var/cache/apk/*
ADD ./bin /usr/local/sbin
VOLUME /etc/openvpn
EXPOSE 443/tcp 1194/udp 8080/tcp
CMD run