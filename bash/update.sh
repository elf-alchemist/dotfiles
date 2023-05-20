#!/bin/usr/bash

#==============================================================================
#
# Update the Brew
#
#==============================================================================

echo -e "\n\t# Updating Homebrew\n"
brew update
brew upgrade

#==============================================================================
#
# Update Node.js
#
#==============================================================================

echo -e "\n\t# Updating NPM\n"
npm update --global

echo -e "\n\t# Updating Yarn\n"
yarn global upgrade

echo -e "\n\t# Updating PNPM\n"
pnpm update --global

#==============================================================================
#
# Update the host
#
#==============================================================================

echo -e "\n\t# Updating APT\n"
sudo apt update
sudo apt list --upgradable

echo -en "\nDo you wish to upgrade? [Y/n] " && read yesno
case $yesno in
	[Yy]* )
		echo -e "\nOperation cancelled, moving on."
		sudo apt upgrade -y
	;;
	[Nn]* )
		echo -e "\nOperation cancelled, not upgrading."
	;;
	* )
		echo -e "\nOperation cancelled; Invalid input.\n"
	;;
esac

