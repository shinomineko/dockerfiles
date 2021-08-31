FROM python:3-alpine

RUN apk update \
	&& apk upgrade \
	&& apk add bash vim --no-cache \
	&& rm -rf /var/cache/apk/* \
	&& pip install --no-cache-dir jenkins-job-builder

WORKDIR /jjb

ENTRYPOINT [ "/usr/local/bin/jenkins-jobs" ]
