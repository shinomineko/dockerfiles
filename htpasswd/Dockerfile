FROM alpine:3.17

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache apache2-utils \
	&& rm -rf /var/cache/apk/*

ENTRYPOINT [ "htpasswd" ]
CMD [ "--help" ]
