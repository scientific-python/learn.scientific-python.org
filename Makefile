.PHONY: help prepare cookie cookie_ruby_deps external html serve clean
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

cookie: cookie_ruby_deps
	(cd external-content/cookie && \
	JEKYLL_ENV=production bundle exec jekyll build --destination ../../public/development --baseurl "/development/")

external: cookie

html: ## Build learn site (without external content) in `./public`
html: prepare
	hugo

html-all: ## Buildlearn site (with external content) in `./public`
html-all: html external

serve: ## Serve site, typically on http://localhost:1313
serve: prepare
	@hugo --printI18nWarnings server

clean: ## Remove built files
clean:
	rm -rf public
