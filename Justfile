build:
	DOCKER_BUILDKIT=1 docker build --pull --no-cache -t shinomineko/"$(basename ${PWD%/*}:$(basename ${PWD%}))" .

push:
	docker push shinomineko/"$(basename ${PWD%/*}:$(basename ${PWD%}))"

publish: build push
