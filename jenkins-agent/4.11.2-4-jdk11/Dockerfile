FROM jenkins/inbound-agent:4.11.2-4-jdk11

USER root
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt install -y \
	bash \
	ca-certificates \
	curl \
	gettext \
	git \
	groff \
	jq \
	less \
	make \
	unzip \
	zip \
	--no-install-recommends \
	&& rm -rf /var/lib/api/lists/*

ARG DOCKER_CLI_VERSION=20.10.17
RUN curl -sfL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
	&& unzip awscliv2.zip \
	&& ./aws/install \
	&& rm -f awscliv2.zip \
	&& curl -sfL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_CLI_VERSION}.tgz -o docker.tgz \
	&& tar xzf docker.tgz \
	&& cp ./docker/docker /usr/local/bin/docker \
	&& rm -rf docker docker.tgz

USER jenkins
