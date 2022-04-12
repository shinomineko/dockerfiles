FROM alpine:3.15
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache apache2-utils \
	&& rm -rf /var/cache/apk/*

ENTRYPOINT [ "htpasswd" ]
CMD [ "--help" ]
