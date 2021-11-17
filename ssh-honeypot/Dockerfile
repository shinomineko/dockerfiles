FROM alpine:3.14
LABEL maintainer "sc@shinomin.me"

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	bash \
	curl \
	git \
	libssh-dev \
	screen \
	gcc \
	musl-dev \
	openssl \
	build-base \
	openssh \
	geoip \
	netcat-openbsd \
	clang \
	json-c-dev \
	libssh2-dev \
	&& rm -rf /var/cache/apk/* \
	&& git clone https://github.com/droberson/ssh-honeypot.git

WORKDIR /ssh-honeypot/

RUN make \
	&& ssh-keygen -t rsa -f ./ssh-honeypot.rsa -N "" \
	&& chmod 777 /ssh-honeypot/bin/ssh-honeypot \
	&& mv /ssh-honeypot/bin/ssh-honeypot /bin/ssh-honeypot

EXPOSE 22

COPY --chmod=0777 entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
