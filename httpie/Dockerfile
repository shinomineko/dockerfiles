FROM python:3-alpine
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ca-certificates \
	&& rm -rf /var/cache/apk/* \
	&& pip install --no-cache-dir httpie

ENTRYPOINT [ "http" ]
