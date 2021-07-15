FROM alpine:3.14
LABEL maintainer "sc@shinomin.me"

ARG GLIBC_VERSION=2.33-r0

RUN	apk add --no-cache \
	binutils \
	ca-certificates \
	curl \
	&& curl -sLo /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
	&& curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
	&& apk add --no-cache \
	glibc-${GLIBC_VERSION}.apk \
	glibc-bin-${GLIBC_VERSION}.apk \
	&& apk del --no-cache \
	binutils \
	curl \
	&& rm glibc-${GLIBC_VERSION}.apk \
	&& rm glibc-bin-${GLIBC_VERSION}.apk \
	&& rm -rf /var/cache/apk/*
