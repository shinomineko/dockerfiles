ARG GO_VERSION=1.16

FROM golang:${GO_VERSION} as src

FROM jenkins/inbound-agent:4.6-1-alpine

USER root

RUN apk update \
  && apk upgrade

RUN apk add --no-cache \
  bash \
  curl \
  make

USER jenkins

ENV HOME=/home/jenkins

ARG GO_BASE_PATH=/usr/local/go

COPY --from=src ${GO_BASE_PATH} ${GO_BASE_PATH}
COPY --from=src /go ${HOME}

ENV GOPATH=${HOME}/go
ENV PATH="${GOPATH}/bin:${GO_BASE_PATH}/bin:${PATH}"

ENTRYPOINT [ "jenkins-agent" ]
