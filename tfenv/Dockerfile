FROM quay.io/shinomineko/alpine-s6:3.12.1

RUN apk add --no-cache \
  bash \
  curl \
  git

ENV TFENV_VERSION v2.0.0

RUN git clone https://github.com/tfutils/tfenv.git /root/.tfenv

WORKDIR /root/.tfenv

RUN git checkout "${TFENV_VERSION}"

ENV PATH /root/.tfenv/bin:$PATH

ENTRYPOINT [ "/bin/bash" ]
