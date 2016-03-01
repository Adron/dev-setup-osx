#!/usr/bin/env bash

defaults write com.apple.finder AppleShowAllFiles YES; # show hidden files
defaults write com.apple.dock persistent-apps -array; # remove icons in Dock
defaults write com.apple.dock tilesize -int 36; # smaller icon sizes in Dock
defaults write com.apple.dock autohide -bool true; # turn Dock auto-hidng on
defaults write com.apple.dock autohide-delay -float 0; # remove Dock show delay
defaults write com.apple.dock autohide-time-modifier -float 0; # remove Dock show delay
defaults write NSGlobalDomain AppleShowAllExtensions -bool true; # show all file extensions
killall Dock 2>/dev/null;
killall Finder 2>/dev/null;

echo "Setting up ~/.bash_profile...";
touch ~/.bash_profile;

# install Xcode Command Line Tools
# https://github.com/timsutton/osx-vm-templates/blob/ce8df8a7468faa7c5312444ece1b977c1b2f77a4/scripts/xcode-cli-tools.sh
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew install \
  caskroom/cask/brew-cask \
  git \
  python \
  wget \
;
brew tap caskroom/versions;
brew cask install \
  dropbox \
  firefox \
  google-chrome \
  java \
  sublime-text \
  vagrant \
  vagrant-manager \
  virtualbox \
  webstorm \
  intellij-idea \
  atom \
  iterm2 \
  dockertoolbox \
;

# Install Node Version Manager (nvm) and install latest stable version and 4.3.1.
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash;
# Source bash file to enable nvm use.
source ~/.bash_profile
# Install last v4 version and stable version.
nvm install 4.3.1;
nvm install stable;
# Set the stable version as default.
nvm alias default stable;

