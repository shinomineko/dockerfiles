.PHONY: dry
dry: ## dry run the build
	@docker buildx bake --print --set *.labels.org.opencontainers.image.revision="$(shell git rev-parse HEAD)"

.PHONY: build
build: ## build all the dockerfiles in the repository
	@docker buildx bake --set *.labels.org.opencontainers.image.revision="$(shell git rev-parse HEAD)"

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
