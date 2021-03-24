FROM registry.access.redhat.com/ubi8/ubi

USER root

ARG GROUP=jenkins
ARG USER=jenkins
ARG GID=1000
ARG UID=1000
ARG AGENT_WORKDIR=/home/${USER}/agent
ARG REMOTING_VERSION=4.6

RUN groupadd -g ${GID} ${GROUP} \
  && useradd -m -g ${GROUP} -u ${UID} ${USER}

RUN dnf upgrade -q -y

RUN dnf install -q -y \
  bash \
  curl \
  git \
  git-lfs \
  java-11-openjdk-devel \
  make \
  openssh-clients \
  openssl \
  python38

RUN pip3 install ansible pywinrm

RUN curl --create-dirs -fsSLo /usr/share/jenkins/agent.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${REMOTING_VERSION}/remoting-${REMOTING_VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/agent.jar \
  && ln -sf /usr/share/jenkins/agent.jar /usr/share/jenkins/slave.jar

RUN curl -fsSLo /usr/local/bin/jenkins-agent https://raw.githubusercontent.com/jenkinsci/docker-inbound-agent/master/jenkins-agent \
  && chmod a+x /usr/local/bin/jenkins-agent \
  && ln -sf /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave

USER ${USER}

ENV AGENT_WORKDIR=${AGENT_WORKDIR}

RUN mkdir -p /home/${USER}/.jenkins \
  && mkdir -p ${AGENT_WORKDIR}

VOLUME /home/${USER}/.jenkins
VOLUME ${AGENT_WORKDIR}

WORKDIR /home/${USER}

ENTRYPOINT [ "jenkins-agent" ]
