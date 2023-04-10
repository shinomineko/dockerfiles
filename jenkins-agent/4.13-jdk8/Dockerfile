FROM jenkins/inbound-agent:4.13.3-1-jdk8

USER root
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt install -y \
		ansible \
		apt-transport-https \
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
		python3-pip \
		sshpass \
		unzip \
		wget \
		zip \
	--no-install-recommends

RUN mkdir -p /etc/apt/keyrings \
	&& wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc \
	&& echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list \
	&& apt-get update \
	&& apt-get install -y temurin-11-jre --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
		pypsrp \
		pywinrm

ARG DOCKER_CLI_VERSION=20.10.23

RUN curl -sfL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_CLI_VERSION}.tgz -o docker.tgz \
	&& tar xzf docker.tgz \
	&& cp ./docker/docker /usr/local/bin/docker \
	&& rm -rf docker* \
	&& curl -sfLo /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
	&& chmod a+x /usr/local/bin/kubectl

USER jenkins
