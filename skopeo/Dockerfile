FROM alpine:3.13
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ca-certificates \
	skopeo \
	&& rm -rf /var/cache/apk/*

WORKDIR /img

ENTRYPOINT [ "/usr/bin/skopeo" ]
