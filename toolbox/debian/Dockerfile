FROM debian:bookworm-slim

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		bash \
		ca-certificates \
		curl \
		jq \
		wget \
		dnsutils \
		netcat-openbsd \
		openssh-client \
		openssl \
		--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash" ]
