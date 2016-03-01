#!/usr/bin/env bash

echo "Showing all files, because you'll need that.";
defaults write com.apple.finder AppleShowAllFiles YES;
defaults write NSGlobalDomain AppleShowAllExtensions -bool true;
echo "Removing junk icons from the dock.";
defaults write com.apple.dock persistent-apps -array;
echo "Dock tile size set to 36.";
defaults write com.apple.dock tilesize -int 36;
echo "Dock set to auto-hide.";
defaults write com.apple.dock autohide -bool true;
echo "Removing dock show delay.";
defaults write com.apple.dock autohide-delay -float 0;
defaults write com.apple.dock autohide-time-modifier -float 0;

echo "Killing dock and finder so they'll restart."
killall Dock 2>/dev/null;
killall Finder 2>/dev/null;

echo "Setting up ~/.bash_profile...";
touch ~/.bash_profile;

echo "Install Xcode Command Line Tools";
# This removes the command prompt GUI nonsense.
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;

echo "Installing Homebrew, the missing package manager for OS X!"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
echo "Using brew to install git, python, and wget."
brew install \
  caskroom/cask/brew-cask \
  git \
  python \
  wget \
;
brew tap caskroom/versions;
echo "Using brew cask to install dropbox, firefox, chrome, java, sublime, vagrant & manager, " \
  "virtualbox, webstorm, intellij-idea, atom, iterm2, and dockertoolbox.";
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

echo "Installing Node Version Manager (nvm) and install latest stable version and 4.3.1.";
echo "  Referenced from http://compositecode.com/docs/the-latest-best-way-to-install-node-js/";
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash;
# Source bash file to enable nvm use.
source ~/.bash_profile
echo "Installing v4.3.1 version as fallback and stable version (likely a 5.x).";
nvm install 4.3.1;
nvm install stable;
# Set the stable version as default.
echo "  Setting stable Node.js version to default. To determine version type 'node --version'";
nvm alias default stable;

echo "Docker preparation, creating default VM in Virtual Box."
docker-machine create default --driver virtualbox;
docker-machine start default
docker-machine env default;
eval $(docker-machine env default);

echo "Pull Docker image for Zookeeper & Exhibitor.";
echo "  Docker Hub Image => https://hub.docker.com/r/adron/systemic-dockzoo/";
echo "  Github Repo => https://github.com/Adron/systemic-dockzoo";
docker pull adron/systemic-dockzoo;
echo "Starting Docker image as container with ports 8181 for Exhibitor. Navigate to http://192.168.x.y:8181" \
  " to view Exhibitor. Once image is running you can also open Kitematic to view.";
docker run -p 8181:8181 -p 2181:2181 -p 2888:2888 -p 3888:3888 -d adron/systemic-dockzoo;
