FROM quay.io/shinomineko/alpine-s6:3.13

RUN apk add --no-cache \
  bash \
  curl \
  git \
  libssh-dev \
  screen \
  gcc \
  musl-dev \
  openssl \
  build-base \
  openssh \
  geoip \
  netcat-openbsd \
  clang \
  json-c-dev \
  libssh2-dev \
  && git clone https://github.com/droberson/ssh-honeypot.git

WORKDIR /ssh-honeypot/

RUN make \
  && ssh-keygen -t rsa -f ./ssh-honeypot.rsa -N "" \
  && chmod 777 /ssh-honeypot/bin/ssh-honeypot \
  && mv /ssh-honeypot/bin/ssh-honeypot /bin/ssh-honeypot

EXPOSE 22

COPY entrypoint.sh /entrypoint.sh

RUN chmod 777 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
