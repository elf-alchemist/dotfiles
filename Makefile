
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

BREW_BASE := coreutils moreutils findutils diffutils binutils inetutils
BREW_BASE += bash bash-completion@2 grep gawk gnu-sed gnu-tar gnu-which

BREW_SHELL := gcc make curl openssh
BREW_SHELL := git nano nanorc neovim emacs
BREW_SHELL += tmux htop fff fzf jq

BREW_TOOL := ffmpeg pandoc

BREW_LANG := nvm shc shfmt shellcheck

BREW_LINUX  := elfutils docker docker-compose
BREW_DARWIN := --cask firefox iterm2 steam
BREW_FONTS  := font-fira-code font-fira-code-nerd-font

XDG_CONFIG_HOME := $(HOME)/.config
XDG_CACHE_HOME  := $(HOME)/.cache
XDG_DATA_HOME   := $(HOME)/.local/share
XDG_STATE_HOME  := $(HOME)/.local/state
SSH_HOME        := $(HOME)/.ssh

BASH_RC         := $(HOME)/.bashrc
BASH_PROFILE    := $(HOME)/.bash_profile

.DEFAULT: default
.PHONY: install_base install_linux install_darwin reinstall_base reinstall_linux

default:
	@echo -e "Welcome to the dotfiles downtown!"
	@echo -e ""
	@echo -e "Screw you! Install me!"
	@echo -e ""
	@echo -e "Run 'make install_linux' or 'make install_darwin'!"
	@echo -e ""
	@echo -e "If you are not an idiot you WILL run 'make setup_shell' and 'make setup_tmux'!"

install_base:
	@brew tap "homebrew/bundle"
	@brew tap "homebrew/services"
	@brew install $(BREW_BASE)
	@brew install $(BREW_SHELL)
	@brew install $(BREW_LANG)

install_linux: install_base
	@brew tap "homebrew/linux-fonts"
	@brew install $(BREW_LINUX)
	@brew install $(BREW_FONTS)

install_darwin: install_base
	@brew tap "homebrew/cask-fonts"
	@brew install $(BREW_DARWIN)
	@brew install $(BREW_FONTS)

reinstall_base:
	@brew reinstall $(BREW_BASE)
	@brew reinstall $(BREW_SHELL)
	@brew reinstall $(BREW_LANG)

reinstall_linux: reinstall_base
	@brew reinstall $(BREW_LINUX)
	@brew reinstall $(BREW_FONTS)

reinstall_darwin: reinstall_base
	@brew reinstall $(BREW_DARWIN)
	@brew reinstall $(BREW_FONTS)

setup_shell:
	@if ! fgrep -q "$(BREW_PREFIX)/bin/bash" /etc/shells; then \
	  echo "$(BREW_PREFIX)/bin/bash" | sudo tee -a /etc/shells \
	  chsh -s "$(BREW_PREFIX)/bin/bash" \
	fi

setup_tmux:
	@rm -rf $(HOME)/.config/tmux/plugins/tpm
	@git clone https://github.com/tmux-plugins/tpm $(HOME)/.config/tmux/plugins/tpm --quiet
	@tmux source-file $(HOME)/.config/tmux/tmux.conf

