
BREW_PREFIX := $(brew --prefix)

BREW_BASE := coreutils moreutils findutils diffutils binutils inetutils
BREW_BASE += bash bash-completion@2 gawk gnu-tar gnu-sed gnu-which

BREW_SHELL := gcc make curl wget openssh gnupg git lazygit vim neovim
BREW_SHELL += tmux htop fff fzf tree bat jq

BREW_LANG := nvm pnpm

BREW_FONTS := font-fira-code font-fira-code-nerd-font

BREW_LINUX := elfutils docker docker-compose

BREW_DARWIN := --cask firefox iterm2 raycast
BREW_DARWIN += steam epic-games gzdoom

brew_tap_extras:
	@brew tap "homebrew/bundle"
	@brew tap "homebrew/services"

brew_tap_linux: brew_tap_extras
	@brew tap "homebrew/linux-fonts"

brew_tap_darwin: brew_tap_extras
	@brew tap "homebrew/cask-fonts"

brew_install_core: brew_tap_extras
	@brew install $(BREW_BASE)
	@brew install $(BREW_SHELL)
	@brew install $(BREW_LANG)

brew_install_linux: brew_tap_linux
	@brew install $(BREW_LINUX)

brew_install_darwin: brew_tap_darwin
	@brew install $(BREW_DARWIN)

setup_shell:
	@echo "\n\t# Configuring Bash binary\n"
	@if ! fgrep -q "$(BREW_PREFIX)/bin/bash" /etc/shells; then \
	  echo "$(BREW_PREFIX)/bin/bash" | sudo tee -a /etc/shells; \
	  chsh -s "$(BREW_PREFIX)/bin/bash"; \
	fi

setup_neovim:
	@echo "\n\t# Cleaning up old NeoVim config\n"
	@rm -rf $(HOME)/.config/nvim
	@rm -rf $(HOME)/.local/state/nvim
	@rm -rf $(HOME)/.local/share/nvim

	@echo "\n\t# Cloning new NvChad config\n"
	@git clone https://github.com/NvChad/NvChad $(HOME)/.config/nvim --depth 1

setup_tmux:
	@echo "\n\t# Cleaning up old TMux config\n"
	@rm -rf $(HOME)/.config/tmux/plugins/tpm

	@echo "\n\t# Cloning new TMux config\n"
	@git clone https://github.com/tmux-plugins/tpm $(HOME)/.config/tmux/plugins/tpm
	@tmux source-file $(HOME)/.config/tmux/tmux.conf
