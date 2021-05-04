FROM alpine:3.13
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	file \
	shellcheck \
	&& rm -rf /var/cache/apk/*

WORKDIR /src

CMD [ "shellcheck" ]
