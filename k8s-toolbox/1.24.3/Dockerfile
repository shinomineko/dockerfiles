FROM debian:bullseye-slim

ARG KUBECTL_VERSION=1.24.3
ARG KUSTOMIZE_VERSION=4.5.5
ARG OC_VERSION=4.10.22
ARG KUBENS_VERSION=0.9.4
ARG HELM_VERSION=3.9.1
ARG STERN_VERSION=1.22.0

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		ca-certificates \
		curl \
		git \
		vim \
		watch \
		--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -sLo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
	&& chmod a+x /usr/local/bin/kubectl

RUN curl -sLO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
	&& tar xzf kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
	&& mv kustomize /usr/local/bin/kustomize \
	&& chmod a+x /usr/local/bin/kustomize \
	&& rm -f kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz

RUN curl -sLO https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/${OC_VERSION}/openshift-client-linux.tar.gz \
	&& tar xzf openshift-client-linux.tar.gz \
	&& mv oc /usr/local/bin/oc \
	&& chmod a+x /usr/local/bin/oc \
	&& rm -f openshift-client-linux.tar.gz kubectl README.md

RUN curl -sLO https://github.com/ahmetb/kubectx/releases/download/v${KUBENS_VERSION}/kubens_v${KUBENS_VERSION}_linux_x86_64.tar.gz \
	&& tar xzf kubens_v${KUBENS_VERSION}_linux_x86_64.tar.gz \
	&& mv kubens /usr/local/bin/kubens \
	&& chmod a+x /usr/local/bin/kubens \
	&& rm -f kubens_v${KUBENS_VERSION}_linux_x86_64.tar.gz LICENSE

RUN curl -sLO https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
	&& tar xzf helm-v${HELM_VERSION}-linux-amd64.tar.gz \
	&& mv linux-amd64/helm /usr/local/bin/helm \
	&& chmod a+x /usr/local/bin/helm \
	&& rm -rf helm-v${HELM_VERSION}-linux-amd64.tar.gz linux-amd64 \
	&& helm plugin install https://github.com/databus23/helm-diff

RUN curl -sLO https://github.com/stern/stern/releases/download/v${STERN_VERSION}/stern_${STERN_VERSION}_linux_amd64.tar.gz \
	&& tar zxf stern_${STERN_VERSION}_linux_amd64.tar.gz \
	&& mv stern /usr/local/bin/stern \
	&& chmod a+x /usr/local/bin/stern \
	&& rm -f stern_${STERN_VERSION}_linux_amd64.tar.gz LICENSE

WORKDIR /app
