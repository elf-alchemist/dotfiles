#!/usr/bin/env bash

source "${HOME}/dotfiles/bin/bashrc"

source "${HOME}/dotfiles/bin/esrc"

if command -v woof &> /dev/null; then
	source "${HOME}/dotfiles/bin/woofrc"
fi

if command -v brew &> /dev/null; then
	source "${HOME}/dotfiles/bin/brewrc"
fi

