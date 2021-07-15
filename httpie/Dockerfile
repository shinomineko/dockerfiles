FROM alpine:3.14
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ca-certificates \
	python3 \
	py3-pip \
	&& rm -rf /var/cache/apk/* \
	&& pip install --no-cache-dir httpie

ENTRYPOINT [ "http" ]
