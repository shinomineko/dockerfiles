.PHONY: dry
dry: ## dry run the build
	@docker buildx bake --print --set *.labels.org.opencontainers.image.revision="$(shell git rev-parse HEAD)"

.PHONY: all
all: ## build all the dockerfiles in the repository
	@docker buildx bake --set *.labels.org.opencontainers.image.revision="$(shell git rev-parse HEAD)"

.PHONY: build
build: ## build the $target
	@docker buildx bake --set *.labels.org.opencontainers.image.revision="$(shell git rev-parse HEAD)" $(target)

.PHONY: publish
publish: ## build and push the $target
	@docker buildx bake --set *.labels.org.opencontainers.image.revision="$(shell git rev-parse HEAD)" --push $(target)

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
