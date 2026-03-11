ci: clean stage deps test-makefile

clean:
	rm -rf stage/

clean-makefile:
	rm -rf stage/makefile/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-makefile: clean-makefile
	node_modules/.bin/plop makefile

test-makefile:
	node_modules/.bin/plop makefile -- \
	    --project_id "somemakefile" \
		--project_name "SomeMakefile" \
		--project_desc "Makefile project" \
		--author_name "Cliffano Subagio" \
		--author_email "cliffano@gmail.com" \
		--github_id "cliffano" \
		--github_repo "somemakefile"
	cd stage/makefile/ && \
	  make ci

.PHONY: ci clean clean-makefile stage deps generate-makefile test-makefile