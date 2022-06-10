FROM alpine:3.16
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache transmission-daemon \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p \
	/transmission/download \
	/transmission/watch \
	/transmission/incomplete \
	/transmission/config \
	&& chmod 1777 /transmission

ENV TRANSMISSION_HOME /transmission/config

EXPOSE 9091

ENTRYPOINT [ "/usr/bin/transmission-daemon" ]
CMD [ "--allowed", "127.*,10.*,192.168.*,172.16.*,172.17.*,172.18.*,172.19.*,172.20.*,172.21.*,172.22.*,172.23.*,172.24.*,172.25.*,172.26.*,172.27.*,172.28.*,172.29.*,172.30.*,172.31.*,169.254.*", "--watch-dir", "/transmission/watch", "--encryption-required", "--foreground", "--config-dir", "/transmission/config", "--incomplete-dir", "/transmission/incomplete", "--dht", "--no-auth", "--download-dir", "/transmission/download", "-gsr", "1" ]
