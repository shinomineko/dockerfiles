FROM alpine:3.22

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ca-certificates \
	skopeo \
	&& rm -rf /var/cache/apk/*

WORKDIR /data

ENTRYPOINT [ "skopeo" ]
CMD [ "--help" ]
