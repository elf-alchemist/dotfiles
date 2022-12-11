#!/bin/usr/bash

source "$HOME/.cargo/env"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

PS1='\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)") → '
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}
