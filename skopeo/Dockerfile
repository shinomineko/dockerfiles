FROM alpine:3.14
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ca-certificates \
	skopeo \
	&& rm -rf /var/cache/apk/*

WORKDIR /data

ENTRYPOINT [ "/usr/bin/skopeo" ]
