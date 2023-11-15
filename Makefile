.PHONY: build
build: ## build all the dockerfiles in the repository
	@$(CURDIR)/build-all.sh

.PHONY: test
test: shellcheck diff ## run tests on the repository

# allocate a tty if running interactively
INTERACTIVE := $(shell [ -t 0 ] && echo 1 || echo 0)
ifeq ($(INTERACTIVE), 1)
	DOCKERFLAGS += -t
endif

.PHONY: shellcheck
shellcheck: ## run shellcheck on the scripts
	docker run --rm -i $(DOCKERFLAGS) \
		-v $(CURDIR):/src:ro \
		shinomineko/shellcheck ./shellcheck.sh

.PHONY: diff
diff: ## test the changes to the dockerfiles
	@$(CURDIR)/test.sh

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
