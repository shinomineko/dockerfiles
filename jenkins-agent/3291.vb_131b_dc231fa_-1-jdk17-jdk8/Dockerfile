FROM jenkins/inbound-agent:3291.vb_131b_dc231fa_-1-jdk17

USER root
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		ansible \
		apt-transport-https \
		bash \
		ca-certificates \
		curl \
		gettext \
		git \
		gpg \
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
	--no-install-recommends

RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null \
	&& echo "deb https://packages.adoptium.net/artifactory/deb bookworm main" | tee /etc/apt/sources.list.d/adoptium.list \
	&& apt-get update \
	&& apt-get install -y temurin-8-jdk \
	&& rm -rf /var/lib/apt/lists/* \
	&& update-java-alternatives --set temurin-8-jdk-amd64

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

ENV PATH=/usr/bin:$PATH
ENV JENKINS_JAVA_BIN=/opt/java/openjdk/bin/java
USER jenkins
