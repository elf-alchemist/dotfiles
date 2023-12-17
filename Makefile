
BREW_PREFIX := $(brew --prefix)

# Base commands, primarily to keep the binaries up-to-date.
BREW_BASE := coreutils moreutils findutils diffutils binutils inetutils
BREW_BASE += bash bash-completion@2 gawk gnu-tar gnu-sed gnu-which

# Main programs that I intend to use directly.
BREW_SHELL := gcc make curl openssh git neovim emacs
BREW_SHELL += tmux htop fff fzf tree jq

# Programming language setup.
BREW_LANG := nvm shellcheck

# Platform specific stuff, where fonts resolve to their respective Taps.
BREW_LINUX  := elfutils docker docker-compose
BREW_DARWIN := --cask firefox iterm2 steam
BREW_FONTS  := font-fira-code font-fira-code-nerd-font

# Symlink paths
XDG_CONFIG_HOME := $(HOME)/.config
SSH_HOME        := $(HOME)/.ssh
BASH_RC         := $(HOME)/.bashrc

brew_install_base:
	@brew tap "homebrew/bundle"
	@brew tap "homebrew/services"
	@brew install $(BREW_BASE)
	@brew install $(BREW_SHELL)
	@brew install $(BREW_LANG)

brew_install_linux: brew_install_base
	@brew tap "homebrew/linux-fonts"
	@brew install $(BREW_LINUX)
	@brew install $(BREW_FONTS)

brew_install_darwin: brew_install_base
	@brew tap "homebrew/cask-fonts"
	@brew install $(BREW_DARWIN)
	@brew install $(BREW_FONTS)

brew_reinstall_base:
	@brew reinstall $(BREW_BASE)
	@brew reinstall $(BREW_SHELL)
	@brew reinstall $(BREW_LANG)

brew_reinstall_linux: brew_reinstall_base
	@brew reinstall $(BREW_LINUX)
	@brew reinstall $(BREW_FONTS)

brew_reinstall_darwin: brew_reinstall_base
	@brew reinstall $(BREW_DARWIN)
	@brew reinstall $(BREW_FONTS)

setup_shell:
	@if ! fgrep -q "$(BREW_PREFIX)/bin/bash" /etc/shells; then \
	  echo "$(BREW_PREFIX)/bin/bash" | sudo tee -a /etc/shells; \
	  chsh -s "$(BREW_PREFIX)/bin/bash"; \
	fi

setup_tmux:
	@rm -rf $(HOME)/.config/tmux/plugins/tpm

	@git clone https://github.com/tmux-plugins/tpm $(HOME)/.config/tmux/plugins/tpm --quiet
	@tmux source-file $(HOME)/.config/tmux/tmux.conf
