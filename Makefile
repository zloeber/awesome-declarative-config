SHELL:=/bin/bash
ROOT_PATH:=$(abspath $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
.DEFAULT_GOAL:=help

PYTHON_VENV_PATH:=.venv
LOCAL_BIN_PATH:=$(ROOT_PATH)/.local/bin
APP_PATH:=$(ROOT_PATH)/.local/apps
CONFIG_PATH:=$(ROOT_PATH)/config
ENTRY_LIST?=$(ROOT_PATH)/list.yml
ENTRY_TEST_LIST?=$(ROOT_PATH)/tests/test_list.yml
ENTRY_SCHEMA?=$(CONFIG_PATH)/schemas/api.cue

## Output related vars
ifdef TERM
BOLD := $(shell tput bold)
RED := $(shell tput setaf 1)
GREEN := $(shell tput setaf 2)
YELLOW := $(shell tput setaf 3)
RESET := $(shell tput sgr0)
endif

mkdocs := $(PYTHON_VENV_PATH)/bin/mkdocs
cue := $(LOCAL_BIN_PATH)/cue
pandoc := $(LOCAL_BIN_PATH)/pandoc
mdtoc := $(LOCAL_BIN_PATH)/mdtoc

.PHONY: help
help: ## This help
	@grep --no-filename -E '^[a-zA-Z_/-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: publish
publish: build ## Publish to github pages
	$(mkdocs) gh-deploy --clean

.PHONY: lint
lint: ## Validate the $(ENTRY_LIST) file
	@$(cue) vet $(ENTRY_LIST) $(ENTRY_SCHEMA)

.PHONY: test/schema
test/schema: ## Validate the defined cue schema works as intended
	@$(cue) vet $(ENTRY_TEST_LIST) $(ENTRY_SCHEMA)

.PHONY: link
link: ## Link README.MD to docs folder
	ln -sf $(ROOT_PATH)/README.md $(ROOT_PATH)/docs/README.md
	ln -sf $(ROOT_PATH)/CONTRIBUTING.md $(ROOT_PATH)/docs/CONTRIBUTING.md
	ln -sf $(ROOT_PATH)/CODE-OF-CONDUCT.md $(ROOT_PATH)/docs/CODE-OF-CONDUCT.md

.PHONY: serve
serve: link toc ## Run local webserver to preview the site
	$(mkdocs) serve

.PHONY: build
build: link toc ## Build the site 
	@$(mkdocs) build

.PHONY: show
show: ## Shows some settings
	@echo "$(BOLD)ROOT_PATH$(RESET): $(ROOT_PATH)"
	@echo "$(BOLD)PYTHON_VENV_PATH$(RESET): $(PYTHON_VENV_PATH)"
	@echo "$(BOLD)ENTRY_LIST$(RESET): $(ENTRY_LIST)"
	@echo "$(BOLD)ENTRY_SCHEMA$(RESET): $(ENTRY_SCHEMA)"

.PHONY: deps
deps: venv .dep/githubapps .dep/cue .dep/pandoc .dep/mdtoc ## install dependencies

.PHONY: .dep/githubapps
.dep/githubapps: ## Install githubapp (ghr-installer)
ifeq (,$(wildcard $(APP_PATH)/githubapp))
	@rm -rf $(APP_PATH)
	@mkdir -p $(APP_PATH)
	@git clone https://github.com/zloeber/ghr-installer $(APP_PATH)/githubapp
endif

.PHONY: .dep/mdtoc
.dep/mdtoc:
ifeq (,$(wildcard $(mdtoc)))
	@wget https://github.com/kubernetes-sigs/mdtoc/releases/download/v1.0.0/mdtoc -O $(LOCAL_BIN_PATH)/mdtoc
	@chmod +x $(LOCAL_BIN_PATH)/mdtoc
	@echo "Installed: $(mdtoc)"
endif

.PHONY: .dep/cue
.dep/cue:
ifeq (,$(wildcard $(cue)))
	@$(MAKE) --no-print-directory -C $(APP_PATH)/githubapp auto cuelang/cue INSTALL_PATH=$(LOCAL_BIN_PATH)
	@echo "Installed: $(cue)"
endif

.PHONY: .dep/pandoc
.dep/pandoc:
ifeq (,$(wildcard $(pandoc)))
	@$(MAKE) --no-print-directory -C $(APP_PATH)/githubapp auto pandoc/pandoc INSTALL_PATH=$(LOCAL_BIN_PATH)
	@echo "Installed: $(cue)"
endif

.PHONY: venv
venv:  ## Configure python virtual environment
	@python3 -m venv $(PYTHON_VENV_PATH)
	source $(PYTHON_VENV_PATH)/bin/activate && \
		$(PYTHON_VENV_PATH)/bin/pip3 install --quiet pip wheel --upgrade --index-url=https://pypi.org/simple/ && \
		$(PYTHON_VENV_PATH)/bin/pip3 install --quiet -r $(ROOT_PATH)/requirements.txt

.PHONY: toc
toc: .dep/mdtoc ## Update README.MD TOC
	@$(LOCAL_BIN_PATH)/mdtoc -inplace README.md

# .PHONY: diagrams
# diagrams: ## Create diagrams with pandoc
# 	$(LOCAL_BIN_PATH)/pandoc \
# 		$(ROOT_PATH)/docs/img/declarative-diagram.md \
# 		--to png \
# 		-o $(ROOT_PATH)/docs/img/declarative-diagram.png \
# 		--filter $(PYTHON_VENV_PATH)/bin/pandoc-mermaid