FROM jenkins/inbound-agent:4.6-1-alpine

USER root

RUN apk add --no-cache \
  bash \
  curl \
  make \
  go \

USER jenkins

ENTRYPOINT [ "jenkins-agent" ]
