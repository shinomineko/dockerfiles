FROM jenkins/inbound-agent:4.6-1-jdk11

USER root

RUN apt-get update -qq \
  && apt-get upgrade -qq -y \
  && apt-get install -qq -y \
  bash \
  curl \
  make \
  python3 \
  python3-pip \
  && pip3 install ansible pywinrm

USER jenkins

ENTRYPOINT [ "jenkins-agent" ]
