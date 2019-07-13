# Makefile for install of develepment environment
# command
# > make install user=<user name> project=<project name>
PROJECT_EXIST := $(shell find -name $(project))
# USER_NAME := snst.lab

install:
	ifndef ($(user))
		# if ($(PROJECT_EXIST))
			# @echo "Directory '$(name)' already exists."
		# else
			@make setup_package_json
		# endif
	else
		@echo "Please specify your project name."
	endif

setup_package_json: ./package.json
	@sed -e "s/%USERNAME%/$(user)/g; s/%PROJECTNAME%/$(project)/g;" ./package.json > package.json.master
	@mv package.json.master package.json
	@make setup_gitconfig

setup_gitconfig: ./.gitconfig
	@sed -e "s/%USERNAME%/$(user)/g; s/%PROJECTNAME%/$(project)/g;" ./.gitconfig > .gitconfig.master
	@mv .gitconfig.master .gitconfig
	@make setup_readme_md

setup_readme_md: ./README.md
	@sed -e "s/%USERNAME%/$(user)/g; s/%PROJECTNAME%/$(project)/g;" ./README.md > README.md.master
	@mv README.md.master README.md 
	@make setup_version_md

setup_version_md: ./doc/VERSION.md
	@sed -e "s/%USERNAME%/$(user)/g; s/%PROJECTNAME%/$(project)/g;" ./doc/VERSION.md > ./doc/VERSION.md.master
	@mv ./doc/VERSION.md.master ./doc/VERSION.md
	@make setup_contributing_md

setup_contributing_md: ./doc/CONTRIBUTING.md
	@sed -e "s/%USERNAME%/$(user)/g; s/%PROJECTNAME%/$(project)/g;" ./doc/CONTRIBUTING.md > ./doc/CONTRIBUTING.md.master
	@mv ./doc/CONTRIBUTING.md.master ./doc/CONTRIBUTING.md
	@make setup_index_html

setup_index_html: ./index.html
	@sed -e "s/%USERNAME%/$(user)/g; s/%PROJECTNAME%/$(project)/g;" ./index.html > index.html.master
	@mv index.html.master  index.html
	@make setup_cargo_toml

setup_cargo_toml: ./src/public/wasm/Cargo.toml
	@sed -e "s/%USERNAME%/$(user)/g; s/%PROJECTNAME%/$(project)/g;" ./src/public/wasm/Cargo.toml > ./src/public/wasm/Cargo.toml.master
	@mv ./src/public/wasm/Cargo.toml.master ./src/public/wasm/Cargo.toml
	@make download_license

download_license: ./doc
	curl https://www.apache.org/licenses/LICENSE-2.0.txt > ./doc/LICENSE
	@make npm_install

npm_install:./package.json
	@echo "Now installing node modules. Please wait.."
	npm install
	@make git_init

git_init:
	@git init && git add -A && git commit --allow-empty -m 'first commit'  && git log
