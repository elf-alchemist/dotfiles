
# Base variables
XDG_CONFIG_HOME := $(HOME)/.config
XDG_CACHE_HOME  := $(HOME)/.cache
XDG_DATA_HOME   := $(HOME)/.local/share
XDG_STATE_HOME  := $(HOME)/.local/state

SSH_HOME        := $(HOME)/.ssh
BASH_RC         := $(HOME)/.bashrc
BASH_PROFILE    := $(HOME)/.bash_profile

VSCODE      := $(XDG_CONFIG_HOME)/Code
VSCODE_USER := $(XDG_CONFIG_HOME)/Code/User

# Homebrew Setup
UNAME := $(shell uname -s -m)

ifeq ($(filter Darwin%arm, $(UNAME)), Darwin arm)
  BREW_PREFIX := /opt/homebrew
else ifeq ($(filter Darwin%, $(UNAME)), Darwin)
  BREW_PREFIX := /usr/local
endif

SHELL := $(or $(wildcard $(BREW_PREFIX)/bin/bash), /bin/bash)

# Homebrew packages
BREW_FORMULAE := coreutils moreutils findutils diffutils binutils inetutils
BREW_FORMULAE += bash bash-completion@2 grep gawk gnu-sed gnu-tar gnu-which
BREW_FORMULAE += gcc make curl openssh
BREW_FORMULAE += git nano nanorc neovim emacs
BREW_FORMULAE += tmux htop fff fzf jq
BREW_FORMULAE += nvm shfmt shellcheck pandoc
BREW_FONTS  := font-fira-code font-fira-code-nerd-font

.DEFAULT: default
.PHONY: default clean brew reinstall_brew tmux

default:
	@echo -e "Welcome to the dotfiles Makefile!\n\n"\
	"Run 'make brew' if you are on MacOS.\n\n"\
	"Run 'make tmux' to setup the best terminal multiplexer."

clean:
	@rm -rdf $(VSCODE)/Cache
	@rm -rdf $(VSCODE)/CachedData
	@rm -rdf $(VSCODE)/CachedExtensionVSIXs
	@rm -rdf $(VSCODE)/CachedProfilesData
	@rm -rdf $(VSCODE)/Code\ Cache
	@rm -rdf $(VSCODE)/DawnCache
	@rm -rdf $(VSCODE)/GPUCache
	@rm -rdf $(VSCODE)/logs
	@rm -rdf $(VSCODE_USER)/History
	@rm -rdf $(VSCODE_USER)/workspaceStorage
	@rm -f   $(VSCODE)/.org.chromium.Chromium.*
	@rm -rdf $(HOME)/.config/tmux/plugins/tpm

brew:
	@brew tap "homebrew/bundle"
	@brew tap "homebrew/services"
	@brew tap "homebrew/cask-fonts"
	@brew install $(BREW_FORMULAE)
	@brew install $(BREW_FONTS)

reinstall_brew:
	@brew reinstall $(BREW_FORMULAE)
	@brew reinstall $(BREW_FONTS)

tmux:
	@rm -rdf $(HOME)/.config/tmux/plugins/tpm
	@git clone https://github.com/tmux-plugins/tpm $(HOME)/.config/tmux/plugins/tpm --quiet
	@tmux source-file $(HOME)/.config/tmux/tmux.conf

