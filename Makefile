
SSH_HOME        := $(HOME)/.ssh

VSCODE      := $(XDG_CONFIG_HOME)/Code
VSCODE_USER := $(XDG_CONFIG_HOME)/Code/User

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

tmux:
	@rm -rdf $(HOME)/.config/tmux/plugins/tpm
	@git clone https://github.com/tmux-plugins/tpm $(HOME)/.config/tmux/plugins/tpm --quiet
	@tmux source-file $(HOME)/.config/tmux/tmux.conf

