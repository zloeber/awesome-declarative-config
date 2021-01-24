SHELL:=/bin/bash
ROOT_PATH:=$(abspath $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
.DEFAULT_GOAL:=help

PYTHON_VENV_PATH:=.venv
LOCAL_BIN_PATH:=$(ROOT_PATH)/.local/bin
APP_PATH:=$(ROOT_PATH)/.local/apps
CONFIG_PATH:=$(ROOT_PATH)/config
CUEMOD_PATH:=$(ROOT_PATH)/cue.mod
ENTRY_LIST?=$(ROOT_PATH)/list.yml
ENTRY_TEST_LIST?=$(ROOT_PATH)/tests/test_list.yml
ENTRY_SCHEMA?=$(CUEMOD_PATH)/pkg/schema.cue

## Output related vars
ifdef TERM
BOLD := $(shell tput bold)
RED := $(shell tput setaf 1)
GREEN := $(shell tput setaf 2)
YELLOW := $(shell tput setaf 3)
RESET := $(shell tput sgr0)
endif

# Generic shared variables
ARCH ?= $(shell uname -m)
ifeq ($(OS),Windows_NT)
OS := Windows
else
OS := $(shell sh -c 'uname -s 2>/dev/null || echo not')
endif

HOF_VERSION := 0.5.15
CUE_VERSION := 0.3.0-beta.2
mkdocs := $(PYTHON_VENV_PATH)/bin/mkdocs
cue := $(LOCAL_BIN_PATH)/cue
mdtoc := $(LOCAL_BIN_PATH)/mdtoc
hof := $(LOCAL_BIN_PATH)/hof

.PHONY: help
help: ## This help
	@grep --no-filename -E '^[a-zA-Z_/-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: publish
publish: build ## Publish to github pages
	$(mkdocs) gh-deploy --clean

.PHONY: validate
validate: ## Validate the list.yml file
	@$(cue) vet $(ENTRY_LIST) $(ENTRY_SCHEMA)

.PHONY: test/schema
test/schema: ## Validate the defined cue schema works as intended
	@$(cue) vet $(ENTRY_TEST_LIST) $(ENTRY_SCHEMA)

.PHONY: link
link: ## Link README.MD to docs folder
	ln -sf $(ROOT_PATH)/README.md $(ROOT_PATH)/docs/README.md
	ln -sf $(ROOT_PATH)/CONTRIBUTING.md $(ROOT_PATH)/docs/CONTRIBUTING.md
	ln -sf $(ROOT_PATH)/CODE-OF-CONDUCT.md $(ROOT_PATH)/docs/CODE-OF-CONDUCT.md
	ln -sf $(ROOT_PATH)/DEVELOPMENT.md $(ROOT_PATH)/docs/DEVELOPMENT.md

.PHONY: serve
serve: link toc ## Run local webserver to preview the site
	$(mkdocs) serve

.PHONY: build
build: link toc ## Build the site 
	@$(mkdocs) build

.PHONY: show
show: ## Shows some settings
	@echo "$(BOLD)ROOT_PATH$(RESET): $(ROOT_PATH)"
	@echo "$(BOLD)OS$(RESET): $(OS)"
	@echo "$(BOLD)ARCH$(RESET): $(ARCH)"

.PHONY: deps
deps: venv .dep/cue .dep/mdtoc .dep/hof ## install dependencies

# .PHONY: .dep/githubapps
# .dep/githubapps: ## Install githubapp (ghr-installer)
# ifeq (,$(wildcard $(APP_PATH)/githubapp))
# 	@rm -rf $(APP_PATH)
# 	@mkdir -p $(APP_PATH)
# 	@git clone https://github.com/zloeber/ghr-installer $(APP_PATH)/githubapp
# endif

.PHONY: .dep/mdtoc
.dep/mdtoc: ## Install mdtoc
ifeq (,$(wildcard $(mdtoc)))
	@wget https://github.com/kubernetes-sigs/mdtoc/releases/download/v1.0.0/mdtoc -O $(LOCAL_BIN_PATH)/mdtoc
	@chmod +x $(LOCAL_BIN_PATH)/mdtoc
endif
	@echo "mdtoc binary: $(mdtoc)"

.PHONY: .dep/cue
.dep/cue: ## install cue
ifeq (,$(wildcard $(cue)))
	@mkdir -p /tmp/cue
	@curl --retry 3 --retry-delay 5 --fail -sSL -o - https://github.com/cuelang/cue/releases/download/v$(CUE_VERSION)/cue_$(CUE_VERSION)_$(OS)_$(ARCH).tar.gz | tar -zx -C '/tmp/cue'
	@cp /tmp/cue/cue $(cue)
	@chmod +x $(cue)
endif
	@echo "cue binary: $(cue)"

.PHONY: .dep/hof
.dep/hof: ## Install hof
ifeq (,$(wildcard $(hof)))
	@wget https://github.com/hofstadter-io/hof/releases/download/v$(HOF_VERSION)/hof_$(HOF_VERSION)_$(OS)_$(ARCH) -O $(hof)
	@chmod +x $(hof)
endif
	@echo "hof binary: $(hof)"

.PHONY: venv
venv:  ## Configure python virtual environment
	@python3 -m venv $(PYTHON_VENV_PATH)
	@source $(PYTHON_VENV_PATH)/bin/activate && \
		$(PYTHON_VENV_PATH)/bin/pip3 install --quiet pip wheel --upgrade --index-url=https://pypi.org/simple/ && \
		$(PYTHON_VENV_PATH)/bin/pip3 install --quiet -r $(ROOT_PATH)/requirements.txt

.PHONY: toc
toc: ## Update README.MD TOC
	@$(LOCAL_BIN_PATH)/mdtoc -inplace README.md
