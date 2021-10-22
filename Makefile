REPO ?= docker.io/shinomineko

.PHONY: build
build: ## build all the dockerfiles in the repository
	@$(CURDIR)/build-all.sh

.PHONY: image
image: ## build a specific image (IMAGE=toolbox make image)
	@docker build --rm -t $(REPO)/$(IMAGE) $(IMAGE)

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
