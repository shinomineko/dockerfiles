FROM jenkins/inbound-agent:latest-alpine-jdk11
LABEL maintainer "sc@shinomin.me"

USER root
RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ansible \
	bash \
	ca-certificates \
	curl \
	gettext \
	git \
	jq \
	make \
	openssh-client \
	openssl \
	parallel \
	python3 \
	py3-pip \
	sshpass \
	&& rm -rf /var/cache/apk/* \
	&& pip install --no-cache-dir pywinrm

USER jenkins
