FROM debian:bullseye-slim
ARG MDBOOK_VERSION="v0.4.13"
LABEL maintainer "sc@shinomin.me"
ADD https://github.com/rust-lang/mdBook/releases/download/${MDBOOK_VERSION}/mdbook-${MDBOOK_VERSION}-x86_64-unknown-linux-gnu.tar.gz /tmp/mdbook.tar.gz
RUN apt-get update \
	&& apt-get upgrade -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& tar zxf /tmp/mdbook.tar.gz \
	&& chown root:root mdbook \
	&& mv mdbook /usr/local/bin/mdbook \
	&& rm -f /tmp/mdbook.tar.gz
WORKDIR /src
