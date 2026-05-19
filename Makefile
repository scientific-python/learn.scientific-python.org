.PHONY: help prepare cookie cookie_ruby_deps cookie_web_prepare external html serve clean
.DEFAULT_GOAL := help

# Add help text after each target name starting with '\#\#'
help:   ## show this help
	@echo -e "Help for this makefile\n"
	@echo "Possible commands are:"
	@grep -h "##" $(MAKEFILE_LIST) | grep -v grep | sed -e 's/\(.*\):.*##\(.*\)/    \1: \2/'

prepare:
	git submodule update --init

cookie_ruby_deps:
	(cd external-content/cookie && \
	bundle install)

cookie_web_prepare:
	(cd external-content/cookie && \
    ./helpers/fetch_repo_review_app.sh)

cookie: cookie_ruby_deps cookie_web_prepare
	(cd external-content/cookie && \
	JEKYLL_ENV=production bundle exec jekyll build --destination ../../public/development --baseurl "/development/")

external: cookie

html: ## Build learn site in `./content/_build/html`
html: prepare
	(cd content && myst build --html)

html-all: ## Build learn site with external content in `./public`
html-all: html
	mkdir -p public && cp -r content/_build/html/. public/
	$(MAKE) external

serve: ## Serve site, typically on http://localhost:3000
serve: prepare
	(cd content && myst start)

clean: ## Remove built files
clean:
	rm -rf content/_build public
