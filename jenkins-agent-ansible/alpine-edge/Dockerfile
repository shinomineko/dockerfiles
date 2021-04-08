FROM jenkins/inbound-agent:4.6-1-alpine

USER root

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
  && apk update \
  && apk upgrade \
  && apk add --no-cache \
  ansible \
  bash \
  curl \
  make \
  python3 \
  py3-pip \
  sshpass \
  && pip install pywinrm

USER jenkins

ENTRYPOINT [ "jenkins-agent" ]
