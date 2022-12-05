FROM alpine:3.17

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache tor \
	&& rm -rf /var/cache/apk/*

COPY torrc.default /etc/tor/torrc.default

RUN chown -R tor /etc/tor

USER tor

EXPOSE 9050

ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
