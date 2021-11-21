FROM alpine:3.14
LABEL maintainer "sc@shinomin.me"
RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ansible \
	bash \
	&& rm -rf /var/cache/apk/*

# make ansible happy with arbitrary uid/gid
RUN chmod g=u /etc/passwd /etc/group

COPY --chmod=0755 entrypoint.sh /entrypoint.sh
COPY ansible.cfg /ansible.cfg
ENV ANSIBLE_CONFIG=/ansible.cfg
WORKDIR /src
ENTRYPOINT [ "/entrypoint.sh" ]
