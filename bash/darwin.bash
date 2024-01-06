#!/usr/bin/env bash

# Apple made a mistake
export BASH_SILENCE_DEPRECATION_WARNING=1

# Why Homebrew, why
export PATH="$HOME/.docker/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"
