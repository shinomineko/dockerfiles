FROM jenkins/inbound-agent:4.6-1-alpine

USER root

RUN apk add --no-cache \
  ansible \
  bash \
  curl \
  make \
  python3 \
  py3-pip \
  && pip install pywinrm

USER jenkins

RUN ansible-galaxy collection install community.windows

ENTRYPOINT [ "jenkins-agent" ]
