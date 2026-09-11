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

generate-makefile: clean-makefile
	node_modules/.bin/plop makefile

test-makefile:
	node_modules/.bin/plop makefile -- \
	  --project_id "makefile" \
		--project_name "Makefile" \
		--project_desc "A sample Makefile" \
		--author_name "Pakkun" \
		--author_email "pakkunbot@users.noreply.github.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "makefile" \
		--github_token_prefix "STUDIO"
	cd stage/makefile/ && make ci

########################################
# makefile-partials targets
########################################

clean-makefile-partials:
	rm -rf stage/makefile-partials/

generate-makefile-partials: clean-makefile-partials
	node_modules/.bin/plop makefile-partials

test-makefile-partials:
	node_modules/.bin/plop makefile-partials -- \
	  --project_id "makefile" \
		--project_name "Makefile" \
		--project_desc "A sample Makefile" \
		--author_name "Pakkun" \
		--author_email "pakkunbot@users.noreply.github.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "makefile" \
		--github_token_prefix "STUDIO"

.PHONY: ci clean clean-makefile clean-makefile-partials stage deps deps-extra-apt generate-makefile test-makefile generate-makefile-partials test-makefile-partials
