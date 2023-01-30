#!/usr/bin/bash

alias __curl_deno="curl -fsSL https://deno.land/x/install/install.sh | sh"
alias __curl_dvm="curl -fsSL https://dvm.deno.dev | sh"
alias __curl_nvm="curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash"

function __repo_init() {
	ln ~/.dotfiles/.editorconfig .
	ln ~/.dotfiles/.vscode/settings.json .vscode/
	touch .gitignore
	echo ".vscode" > .gitignore
	mkdir .vscode
	git init
}

function __git_la() {
  git config --global --get-regexp alias | sed "s/alias\.//g" | awk '{printf "| %-12s | %s\n", $1, $0}' | sed '1,3d'
}

function __gi() {
	curl -sL https://www.toptal.com/developers/gitignore/api/$@
}
