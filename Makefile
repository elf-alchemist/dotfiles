.PHONY: install

DOTFILES := $(HOME)/dotfiles
LINK := ln -sfn

install:
	$(LINK) $(DOTFILES)/bin $(HOME)/bin
	$(LINK) $(DOTFILES)/local $(HOME)/.local
	$(LINK) $(DOTFILES)/config $(HOME)/.config
	$(LINK) $(DOTFILES)/config/ssh $(HOME)/.ssh
	$(LINK) $(DOTFILES)/config/irssi $(HOME)/.irssi
	$(LINK) $(DOTFILES)/bashrc $(HOME)/.bashrc
	$(LINK) $(DOTFILES)/bashrc $(HOME)/.bash_profile

