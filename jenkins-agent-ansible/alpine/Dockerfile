FROM jenkins/inbound-agent:4.6-1-alpine

USER root

RUN apk add --no-cache \
  ansible \
  bash \
  curl \
  python3 \
  py3-pip \
  && pip install pywinrm

USER jenkins

ENTRYPOINT [ "jenkins-agent" ]
