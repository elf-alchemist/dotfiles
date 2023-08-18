
BREW_PREFIX := $(brew --prefix)

BREW_BASE  := coreutils moreutils findutils diffutils binutils inetutils
BREW_SHELL := bash bash-completion@2 gawk gnu-tar gnu-sed gnu-which
BREW_CMD   := gcc make curl wget openssh gnupg openvpn git
BREW_TERM  := tmux neovim lazygit htop ctop ranger fzf
BREW_FILE  := tree exa bat duf dust jq
BREW_ECMA  := node yarn pnpm deno
BREW_JAVA  := openjdk gradle

BREW_FONTS  := font-fira-code font-fira-code-nerd-font
BREW_LINUX  := elfutils docker docker-compose
BREW_DARWIN := --cask firefox iterm2 raycast
BREW_DARWIN += tomatobar docker jetbrains-toolbox
BREW_DARWIN += steam epic-games gzdoom


brew_tap_core:
	brew tap "homebrew/bundle"
	brew tap "homebrew/services"

brew_tap_extras: brew_tap_core
	brew tap "petere/postgresql"
	brew tap "tursodatabase/tap"
	brew tap "mongodb/brew"
	brew tap "aws/tap"

brew_tap_linux: brew_tap_extras
	brew tap "homebrew/linux-fonts"

brew_tap_darwin: brew_tap_extras
	brew tap "homebrew/cask-fonts"

brew_install_core: brew_tap_core
	brew install $(BREW_BASE)
	brew install $(BREW_SHELL)
	brew install $(BREW_CMD)
	brew install $(BREW_TERM)
	brew install $(BREW_FILE)
	brew install $(BREW_ECMA)
	brew install $(BREW_JAVA)

brew_install_linux: brew_tap_linux
	brew install $(BREW_LINUX)

brew_install_darwin: brew_tap_darwin
	brew install $(BREW_DARWIN)
