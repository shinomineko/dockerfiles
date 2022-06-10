FROM alpine:3.16
LABEL maintainer "sc@shinomin.me"

ARG USER=squid

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache squid \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /run/squid \
	&& chown ${USER}:${USER} /run/squid

EXPOSE 3128

COPY ./squid.conf /etc/squid/squid.conf

USER ${USER}

ENTRYPOINT [ "squid" ]
CMD [ "-f", "/etc/squid/squid.conf", "-NCd 1" ]
