#!/usr/bin/bash


alias __curl_deno="curl -fsSL https://deno.land/x/install/install.sh | sh"
alias __curl_dvm="curl -fsSL https://dvm.deno.dev | sh"
alias __curl_nvm="curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash"
alias __curl_rust="curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"

function __repo_init() {
	ln ~/.dotfiles/.editorconfig .
	ln ~/.dotfiles/.vscode/settings.json .vscode/
	touch .gitignore
	echo ".vscode" > .gitignore
	mkdir .vscode
	git init
}

function __gi() {
	curl -sL https://www.toptal.com/developers/gitignore/api/$@
}
