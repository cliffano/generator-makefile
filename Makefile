define deps_extra
	@if command -v apt-get > /dev/null 2>&1; then \
		if [ "$$(id -u)" = "0" ]; then \
			$(MAKE) deps-extra-apt; \
		else \
			sudo $(MAKE) deps-extra-apt; \
		fi; \
	fi
endef

ci: clean stage deps test-makefile test-makefile-partials

clean:
	rm -rf stage/

########################################
# makefile targets
########################################

clean-makefile:
	rm -rf stage/makefile/

stage:
	mkdir -p stage/

deps:
	$(call deps_extra)
	npm install .

deps-extra-apt:
	apt-get install -y markdownlint

########################################
# Utility targets
########################################

GENERATOR_CONFIG ?= makefile.yml

define set_generator_vars
$(1): GENERATOR_COMPONENT = $$(shell yq .generator.component $(2))
$(1): GENERATOR_INPUTS_PROJECT_ID = $$(shell yq .generator.inputs.project_id $(2))
$(1): GENERATOR_INPUTS_PROJECT_NAME = $$(shell yq .generator.inputs.project_name $(2))
$(1): GENERATOR_INPUTS_PROJECT_DESC = $$(shell yq .generator.inputs.project_desc $(2))
$(1): GENERATOR_INPUTS_AUTHOR_NAME = $$(shell yq .generator.inputs.author_name $(2))
$(1): GENERATOR_INPUTS_AUTHOR_EMAIL = $$(shell yq .generator.inputs.author_email $(2))
$(1): GENERATOR_INPUTS_AUTHOR_URL = $$(shell yq .generator.inputs.author_url $(2))
$(1): GENERATOR_INPUTS_GITHUB_ID = $$(shell yq .generator.inputs.github_id $(2))
$(1): GENERATOR_INPUTS_GITHUB_REPO = $$(shell yq .generator.inputs.github_repo $(2))
$(1): GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX = $$(shell yq .generator.inputs.github_token_prefix $(2))
endef

generate-makefile: clean-makefile
	node_modules/.bin/plop makefile

$(eval $(call set_generator_vars,generate-makefile-with-config,$(GENERATOR_CONFIG)))
generate-makefile-with-config: clean-makefile
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-makefile: clean-makefile
	make generate-makefile-with-config GENERATOR_CONFIG=examples/makefile-makefile.yml
	cd stage/makefile/ && make ci

########################################
# makefile-partials targets
########################################

clean-makefile-partials:
	rm -rf stage/makefile-partials/

generate-makefile-partials: clean-makefile-partials
	node_modules/.bin/plop makefile-partials

$(eval $(call set_generator_vars,generate-makefile-partials-with-config,$(GENERATOR_CONFIG)))
generate-makefile-partials-with-config: clean-makefile-partials
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-makefile-partials: clean-makefile-partials
	make generate-makefile-partials-with-config GENERATOR_CONFIG=examples/makefile-makefile-partials.yml

.PHONY: ci clean clean-makefile clean-makefile-partials stage deps deps-extra-apt generate-makefile generate-makefile-with-config test-makefile generate-makefile-partials generate-makefile-partials-with-config test-makefile-partials
