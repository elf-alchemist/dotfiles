#!/usr/bin/bash

function curl_deno() {
	curl -fsSL https://deno.land/x/install/install.sh | sh
	curl -fsSL https://dvm.deno.dev | sh
}

function repo_init() {
	ln ~/.dotfiles/.editorconfig .
	ln ~/.dotfiles/.vscode/settings.json .vscode/
	touch .gitignore
	mkdir .vscode
}

function gi() {
	curl -sL https://www.toptal.com/developers/gitignore/api/$@
}
