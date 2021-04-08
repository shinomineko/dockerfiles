FROM alpine:3.13

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
  openssl

CMD [ "/bin/bash" ]
