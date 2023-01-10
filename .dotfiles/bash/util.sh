#!/usr/bin/bash

function __curl_deno() {
	curl -fsSL https://deno.land/x/install/install.sh | sh
	curl -fsSL https://dvm.deno.dev | sh
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

function __repo_init() {
	ln ~/.dotfiles/.editorconfig .
	ln ~/.dotfiles/.vscode/settings.json .vscode/
	touch .gitignore
	echo "vscode" > .gitignore
	mkdir .vscode
}

function __gi() {
	curl -sL https://www.toptal.com/developers/gitignore/api/$@
}
