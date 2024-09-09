FROM python:3.10-alpine

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ca-certificates \
	&& rm -rf /var/cache/apk/* \
	&& pip install --no-cache-dir httpie

ENTRYPOINT [ "http" ]
CMD [ "--help" ]
