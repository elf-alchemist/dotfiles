
UNAME := $(shell uname -s -m)

ifeq ($(filter Linux%, $(UNAME)), Linux)
  BREW_PREFIX := /home/linuxbrew/.linuxbrew
else ifeq ($(filter Darwin%arm, $(UNAME)), Darwin arm)
  BREW_PREFIX := /opt/homebrew
else ifeq ($(filter Darwin%, $(UNAME)), Darwin)
  BREW_PREFIX := /usr/local
else
  BREW_PREFIX :=
endif

SHELL := $(or $(wildcard $(BREW_PREFIX)/bin/bash), /bin/bash)

BREW_FORMULAE := coreutils moreutils findutils diffutils binutils inetutils
BREW_FORMULAE += bash bash-completion@2 grep gawk gnu-sed gnu-tar gnu-which
BREW_FORMULAE += gcc make curl openssh
BREW_FORMULAE += git nano nanorc neovim emacs
BREW_FORMULAE += tmux htop fff fzf jq
BREW_FORMULAE += nvm shfmt shellcheck
BREW_FORMULAE += ffmpeg pandoc

BREW_LINUX  := elfutils
BREW_DARWIN := --cask iterm2
BREW_FONTS  := font-fira-code font-fira-code-nerd-font

XDG_CONFIG_HOME := $(HOME)/.config
XDG_CACHE_HOME  := $(HOME)/.cache
XDG_DATA_HOME   := $(HOME)/.local/share
XDG_STATE_HOME  := $(HOME)/.local/state

SSH_HOME        := $(HOME)/.ssh
BASH_RC         := $(HOME)/.bashrc
BASH_PROFILE    := $(HOME)/.bash_profile

VSCODE      := $(XDG_CONFIG_HOME)/Code
VSCODE_USER := $(XDG_CONFIG_HOME)/Code/User

.DEFAULT: default
.PHONY: default clean home linux darwin re_home re_linux re_darwin shell tmux

default:
	@echo -e "Welcome to the dotfiles Makefile!\n\n"\
	"Screw you! Install me!\n\n"\
	"Run 'make linux' or 'make darwin'!\n\n"\
	"If you ain't an idiot, you WILL run 'make shell' and 'make tmux'!"

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

home:
	@brew tap "homebrew/bundle"
	@brew tap "homebrew/services"
	@brew install $(BREW_FORMULAE)

linux: home
	@brew tap "homebrew/linux-fonts"
	@brew install $(BREW_LINUX)
	@brew install $(BREW_FONTS)

darwin: home
	@brew tap "homebrew/cask-fonts"
	@brew install $(BREW_DARWIN)
	@brew install $(BREW_FONTS)

re_home:
	@brew reinstall $(BREW_FORMULAE)

re_linux: re_home
	@brew reinstall $(BREW_LINUX)
	@brew reinstall $(BREW_FONTS)

re_darwin: re_home
	@brew reinstall $(BREW_DARWIN)
	@brew reinstall $(BREW_FONTS)

shell:
	@if ! fgrep -q "$(BREW_PREFIX)/bin/bash" /etc/shells; then \
	  echo "$(BREW_PREFIX)/bin/bash" | sudo tee -a /etc/shells \
	  chsh -s "$(BREW_PREFIX)/bin/bash" \
	fi

tmux:
	@rm -rf $(HOME)/.config/tmux/plugins/tpm
	@git clone https://github.com/tmux-plugins/tpm $(HOME)/.config/tmux/plugins/tpm --quiet
	@tmux source-file $(HOME)/.config/tmux/tmux.conf

