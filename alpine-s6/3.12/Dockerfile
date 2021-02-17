FROM alpine:3.12

ARG S6_VERSION=v2.2.0.3

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-amd64.tar.gz /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / \
  && rm -f /tmp/s6-overlay-amd64.tar.gz

ENTRYPOINT [ "/init" ]

CMD [ "/bin/sh" ]
