FROM alpine:3.14
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache nmap \
	&& rm -rf /var/cache/apk/*

ENTRYPOINT [ "nmap" ]
