
BREW_PREFIX := $(brew --prefix)

BREW_BASE := coreutils moreutils findutils diffutils binutils inetutils
BREW_BASE += bash bash-completion@2 gawk gnu-tar gnu-sed gnu-which

BREW_SHELL := gcc make curl openssh git lazygit vim
BREW_SHELL += tmux htop fff fzf tree jq

BREW_LANG := nvm shellcheck

BREW_LINUX := elfutils docker docker-compose

BREW_DARWIN := --cask firefox iterm2 steam gzdoom

BREW_FONTS := font-fira-code font-fira-code-nerd-font

brew_install:
	@brew tap "homebrew/bundle"
	@brew tap "homebrew/services"
	@brew install $(BREW_BASE)
	@brew install $(BREW_SHELL)
	@brew install $(BREW_LANG)

brew_install_linux: brew_install
	@brew tap "homebrew/linux-fonts"
	@brew install $(BREW_LINUX)
	@brew install $(BREW_FONTS)

brew_install_darwin: brew_install
	@brew tap "homebrew/cask-fonts"
	@brew install $(BREW_DARWIN)
	@brew install $(BREW_FONTS)

brew_reinstall:
	@brew reinstall $(BREW_BASE)
	@brew reinstall $(BREW_SHELL)
	@brew reinstall $(BREW_LANG)

brew_reinstall_linux: brew_reinstall
	@brew reinstall $(BREW_LINUX)
	@brew reinstall $(BREW_FONTS)

brew_reinstall_darwin: brew_reinstall
	@brew reinstall $(BREW_DARWIN)
	@brew reinstall $(BREW_FONTS)

setup_shell:
	@echo "\n\t# Configuring Bash binary\n"
	@if ! fgrep -q "$(BREW_PREFIX)/bin/bash" /etc/shells; then \
	  echo "$(BREW_PREFIX)/bin/bash" | sudo tee -a /etc/shells; \
	  chsh -s "$(BREW_PREFIX)/bin/bash"; \
	fi

setup_tmux:
	@echo "\n\t# Cleaning up old Tmux config\n"
	@rm -rf $(HOME)/.config/tmux/plugins/tpm

	@echo "\n\t# Cloning new TMux config\n"
	@git clone https://github.com/tmux-plugins/tpm $(HOME)/.config/tmux/plugins/tpm
	@tmux source-file $(HOME)/.config/tmux/tmux.conf
