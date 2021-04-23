SHELL := bash

.PHONY: publish
publish: build push

.PHONY: build
build:
	DOCKER_BUILDKIT=1 docker build --pull --no-cache -t shinomineko/toolbox .

.PHONY: push
push:
	docker push -a shinomineko/toolbox
