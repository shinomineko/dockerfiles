FROM alpine:3.13
LABEL maintainer "sc@shinomin.me"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
  bash \
  curl \
  jq \
  wget \
  bind-tools \
  netcat-openbsd \
  openssh-client \
  openssl \
  && rm -rf /var/cache/apk/*

CMD [ "/bin/bash" ]
