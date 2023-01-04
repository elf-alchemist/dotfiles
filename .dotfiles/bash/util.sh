#!/usr/bin/bash

function __curl_deno() {
	curl -fsSL https://deno.land/x/install/install.sh | sh
	curl -fsSL https://dvm.deno.dev | sh
}

function __repo_init() {
	ln ~/.dotfiles/.editorconfig .
	ln ~/.dotfiles/.vscode/settings.json .vscode/
	touch .gitignore
	mkdir .vscode
}

function __gi() {
	curl -sL https://www.toptal.com/developers/gitignore/api/$@
}
