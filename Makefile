
BREW_PREFIX := $(brew --prefix)

BREW_BASE := coreutils moreutils findutils diffutils binutils inetutils
BREW_BASE += bash bash-completion@2 gawk gnu-tar gnu-sed gnu-which

BREW_SHELL := gcc make curl wget openssh gnupg openvpn git
BREW_SHELL += tmux vim neovim emacs lazygit htop fff fzf irssi mutt
BREW_SHELL += tree exa bat jq gzip p7zip

BREW_LANG := node yarn pnpm deno
BREW_LANG += openjdk gradle
BREW_LANG += perl

BREW_FONTS := font-fira-code font-fira-code-nerd-font

BREW_LINUX := elfutils docker docker-compose

BREW_DARWIN := --cask firefox iterm2 raycast
BREW_DARWIN += tomatobar jetbrains-toolbox
BREW_DARWIN += steam epic-games gzdoom

brew_tap_extras:
	brew tap "homebrew/bundle"
	brew tap "homebrew/services"
	brew tap "d12frosted/emacs-plus"
	brew tap "petere/postgresql"
	brew tap "tursodatabase/tap"
	brew tap "mongodb/brew"
	brew tap "aws/tap"

brew_tap_linux: brew_tap_extras
	brew tap "homebrew/linux-fonts"

brew_tap_darwin: brew_tap_extras
	brew tap "homebrew/cask-fonts"

brew_install_core: brew_tap_extras
	brew install $(BREW_BASE)
	brew install $(BREW_SHELL)
	brew install $(BREW_LANG)

brew_install_linux: brew_tap_linux
	brew install $(BREW_LINUX)

brew_install_darwin: brew_tap_darwin
	brew install $(BREW_DARWIN)
