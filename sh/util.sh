#!/usr/bin/bash

alias __curl_deno="curl -fsSL https://deno.land/x/install/install.sh | sh"
alias __curl_dvm="curl -fsSL https://dvm.deno.dev | sh"
alias __curl_nvm="curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash"

function __git_toptal() {
	curl -sL https://www.toptal.com/developers/gitignore/api/$@
}
