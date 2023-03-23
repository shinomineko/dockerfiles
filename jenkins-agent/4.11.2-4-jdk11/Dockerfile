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
	maven \
	unzip \
	wget \
	zip \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ARG DOCKER_CLI_VERSION=20.10.23
ARG KUBECTL_VERSION=1.24.11

RUN curl -sfL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
	&& unzip awscliv2.zip \
	&& ./aws/install \
	&& rm -f awscliv2.zip \
	&& curl -sfL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_CLI_VERSION}.tgz -o docker.tgz \
	&& tar xzf docker.tgz \
	&& cp ./docker/docker /usr/local/bin/docker \
	&& rm -rf docker* \
	&& curl -sfLo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
	&& chmod a+x /usr/local/bin/kubectl

USER jenkins
