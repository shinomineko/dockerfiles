FROM alpine:3.22

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	bash \
	file \
	shellcheck \
	&& rm -rf /var/cache/apk/*

WORKDIR /src

CMD [ "shellcheck" ]
