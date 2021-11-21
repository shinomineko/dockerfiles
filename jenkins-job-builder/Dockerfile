FROM python:3-slim-bullseye
LABEL maintainer "sc@shinomin.me"

RUN apt-get update \
	&& apt-get upgrade -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip install --no-cache-dir jenkins-job-builder

WORKDIR /jjb

ENTRYPOINT [ "/usr/local/bin/jenkins-jobs" ]
