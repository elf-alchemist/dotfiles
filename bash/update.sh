#!/bin/usr/bash

echo -e "\n# Updating Homebrew"
brew update
brew upgrade

echo -e "\n# Updating NPM"
npm update --global

echo -e "\n# Updating Yarn"
yarn global upgrade

echo -e "\n# Updating PNPM"
pnpm update --global

echo -e "\n# Updating APT"
sudo apt update
sudo apt list --upgradable

read -p "Do you wish to upgrade? [Y/n] " yesno
case $yesno in
	[Nn]* )
		echo -e "\nOperation cancelled, not upgrading."
	;;
	* )
		echo -e "\nOperation accepted, moving on\n"
		sudo apt upgrade
	;;
esac
