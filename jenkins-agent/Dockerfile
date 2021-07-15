FROM alpine:3.14
LABEL maintainer "sc@shinomin.me"

USER root

ARG USER=jenkins
ARG AGENT_WORKDIR=/home/${USER}/agent
ARG REMOTING_VERSION=4.7

ENV JAVA_HOME=/usr/lib/jvm/default-jvm

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ansible \
	bash \
	curl \
	git \
	jq \
	make \
	openjdk11 \
	openssh-client \
	openssl \
	python3 \
	py3-pip \
	sshpass \
	unzip \
	zip \
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
