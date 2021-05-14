FROM alpine:3.13
LABEL maintainer "sc@shinomin.me"

USER root

ARG USER=jenkins
ARG AGENT_WORKDIR=/home/${USER}/agent
ARG REMOTING_VERSION=4.7

ENV JAVA_HOME=/usr/lib/jvm/default-jvm

ARG GLIBC_VERSION=2.33-r0

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ansible \
	bash \
	binutils \
	curl \
	git \
	groff \
	jq \
	less \
	make \
	openjdk11 \
	openssh-client \
	openssl \
	python3 \
	py3-pip \
	sshpass \
	unzip \
	zip \
	&& curl -sLo /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
	&& curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
	&& apk add --no-cache \
	glibc-${GLIBC_VERSION}.apk \
	glibc-bin-${GLIBC_VERSION}.apk \
	&& curl -sLo awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip \
	&& unzip awscliv2.zip \
	&& ./aws/install \
	&& rm -rf \
	awscliv2.zip \
	aws \
	&& apk del --no-cache \
	binutils \
	&& rm glibc-${GLIBC_VERSION}.apk \
	&& rm glibc-bin-${GLIBC_VERSION}.apk \
	&& rm -rf /var/cache/apk/* \
	&& pip install --no-cache-dir pywinrm \
	&& curl --create-dirs -fsSLo /usr/share/jenkins/agent.jar \
	https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${REMOTING_VERSION}/remoting-${REMOTING_VERSION}.jar \
	&& chmod 755 /usr/share/jenkins \
	&& chmod 644 /usr/share/jenkins/agent.jar \
	&& ln -sf /usr/share/jenkins/agent.jar /usr/share/jenkins/slave.jar \
	&& curl -fsSLo /usr/local/bin/jenkins-agent \
	https://raw.githubusercontent.com/jenkinsci/docker-inbound-agent/master/jenkins-agent \
	&& chmod a+x /usr/local/bin/jenkins-agent \
	&& ln -sf /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave \
	&& adduser ${USER} -D -h /home/${USER} -s /bin/bash --gecos ""

USER ${USER}

ENV AGENT_WORKDIR=${AGENT_WORKDIR}

RUN mkdir -p /home/${USER}/.jenkins \
	&& mkdir -p ${AGENT_WORKDIR}

VOLUME /home/${USER}/.jenkins
VOLUME ${AGENT_WORKDIR}

WORKDIR /home/${USER}

ENTRYPOINT [ "jenkins-agent" ]
