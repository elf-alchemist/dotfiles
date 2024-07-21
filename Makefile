.PHONY: install

DOTFILES := $(HOME)/dotfiles
XDG_CONFIG_HOME := $(HOME)/.config
XDG_LOCAL_HOME := $(HOME)/.local
XDG_DATA_HOME := $(HOME)/.local/share

XDG_PICTURES_HOME := $(HOME)/Picture
GIT_PATH := $(XDG_DATA_HOME)/git
IMAGICKS := $(GIT_PATH)/alchemist-imagicks

LINK := ln -sfn
CLONE := git clone

install:
	$(LINK) $(DOTFILES)/bin          $(HOME)/bin
	$(LINK) $(DOTFILES)/local        $(HOME)/.local
	$(LINK) $(DOTFILES)/config       $(HOME)/.config
	$(LINK) $(DOTFILES)/config/ssh   $(HOME)/.ssh
	$(LINK) $(DOTFILES)/config/irssi $(HOME)/.irssi
	$(LINK) $(DOTFILES)/bashrc       $(HOME)/.bashrc
	$(LINK) $(DOTFILES)/bashrc       $(HOME)/.bash_profile

setup:
	$(CLONE) git@github:elf-alchemist/imagicks.git $(GIT_PATH)/alchemist-imagicks

post-setup:
	$(LINK) $(IMAGICKS)/profile      $(XDG_PICTURES_HOME)/Profile
	$(LINK) $(IMAGICKS)/picture      $(XDG_PICTURES_HOME)/Misc
	$(LINK) $(IMAGICKS)/wallpaper    $(XDG_PICTURES_HOME)/Wallpaper
	$(LINK) $(IMAGICKS)/memery       $(XDG_PICTURES_HOME)/Memes
	$(LINK) $(IMAGICKS)/luma         $(XDG_PICTURES_HOME)/Luma

