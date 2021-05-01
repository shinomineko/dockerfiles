FROM alpine:3.13
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache aria2 \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /aria2/download \
	&& chmod 1777 /aria2

ENTRYPOINT [ "/usr/bin/aria2c", "-d /aria2/download" ]
