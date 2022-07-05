FROM alpine:3.16

ADD https://github.com/VirtusLab/render/releases/latest/download/render-linux-amd64 /usr/local/bin/render
RUN apk update \
	&& apk upgrade \
	&& rm -rf /var/cache/apk/* \
	&& chmod a+x /usr/local/bin/render

WORKDIR /src
ENTRYPOINT [ "/usr/local/bin/render" ]
CMD [ "--help" ]
