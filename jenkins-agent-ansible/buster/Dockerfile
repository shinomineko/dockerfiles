FROM jenkins/inbound-agent:4.6-1-jdk11

USER root

RUN apt-get update -qq \
  && apt-get install -qq -y \
  bash \
  curl \
  python3 \
  python3-pip

RUN pip3 install ansible pywinrm

USER jenkins

ENTRYPOINT [ "jenkins-agent" ]
