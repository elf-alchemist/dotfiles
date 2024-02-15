#!/usr/bin/env bash

source "$HOME/dotfiles/local/bin/bashrc"

if command -v brew &> /dev/null; then
	source "$HOME/dotfiles/local/bin/brewrc"
fi

