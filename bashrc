#!/usr/bin/env bash

name="$(uname -a)"

source "$HOME/dotfiles/local/bin/init_bash"

if [[ $name == Darwin* ]]; then
	source "$HOME/dotfiles/local/bin/init_darwin"
fi

