FROM alpine:3.16
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	bash \
	file \
	shellcheck \
	&& rm -rf /var/cache/apk/*

WORKDIR /src

CMD [ "shellcheck" ]
