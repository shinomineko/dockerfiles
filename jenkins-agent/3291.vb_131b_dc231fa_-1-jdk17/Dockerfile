FROM jenkins/inbound-agent:3291.vb_131b_dc231fa_-1-jdk17

USER root
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt install -y \
		ansible \
		bash \
		ca-certificates \
		curl \
		gettext \
		git \
		groff \
		jq \
		less \
		make \
		maven \
		parallel \
		python3-pip \
		sshpass \
		unzip \
		wget \
		zip \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
		--break-system-packages \
		pypsrp \
		pywinrm

ARG DOCKER_CLI_VERSION=27.5.1

RUN curl -sfL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_CLI_VERSION}.tgz -o docker.tgz \
	&& tar xzf docker.tgz \
	&& cp ./docker/docker /usr/local/bin/docker \
	&& rm -rf docker* \
	&& curl -sfLo /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
	&& chmod a+x /usr/local/bin/kubectl

USER jenkins
