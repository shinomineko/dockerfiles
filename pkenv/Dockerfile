FROM quay.io/shinomineko/alpine-s6:3.12.1

RUN apk add --no-cache \
  bash \
  curl \
  git

ENV PKENV_VERSION 0.5.0

RUN git clone https://github.com/iamhsa/pkenv.git /root/.pkenv

WORKDIR /root/.pkenv

RUN git checkout "${PKENV_VERSION}"

ENV PATH /root/.pkenv/bin:$PATH

ENTRYPOINT [ "/bin/bash" ]
