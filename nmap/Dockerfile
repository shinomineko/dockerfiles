FROM alpine:3.17

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	nmap \
	nmap-nselibs \
	nmap-scripts \
	&& rm -rf /var/cache/apk/*

ENTRYPOINT [ "nmap" ]
CMD [ "--help" ]
