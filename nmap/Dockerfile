FROM alpine:3.13
LABEL maintainer "sc@shinomin.me"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
  nmap

ENTRYPOINT [ "nmap" ]
