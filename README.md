# dev-setup-osx

This is a repo of tools that I use to setup a development machine on OS-X. To dive right in, just run this script here however...

		bash <(curl -s https://raw.githubusercontent.com/adron-orange/dev-setup-osx/master/starter/setup-osx.sh)

I advise following the steps below to insure the best experience. :)

## Apple ID [Step 01]

[Instructions](https://github.com/adron-orange/dev-setup-osx/blob/master/Apple-ID/applie-id.md)

Setup an Apple ID that can be used for downloads related to patches, updates, Xcode things, Apple Updates, and related content. Create the Apple ID account related to that company to remove yourself from liability for any personal Apple ID content being used on the machine, this insures you're using only company owned products and you're not mistakenly using products that you might have registered on your own Apple ID account. To complete these steps and register an Apple ID follow [these steps](Applie-ID/apple-id.md).

## "The" Script [Step 02]

This script is designed to install a number of things (listed below). It is also assuming that the OS-X Computer you're about to install all of this on hasn't had a single thing installed on it that didn't come from Apple itself. This script will cleanup and install a number of things specifically for development purposes. To run this script just open a terminal and run the following command (Same as mentioned above). During this command you will be prompted a few times for your password to insure installation succeeds, otherwise it is very low maintenance and one can step away and come back as necessary.

		bash <(curl -s https://raw.githubusercontent.com/adron-orange/dev-setup-osx/master/starter/setup-osx.sh)

## Get a "Nick" Registered on IRC [Step 03]

More info to come.

### Tools, IDEs, and Other Software Installed

* git
* Node.js 4.x and 5.x via NVM.
* python
* wget
* dropbox
* firefox
* google-chrome
* java 8
* sublime-text
* vagrant
* vagrant-manager
* virtualbox
* webstorm
* intellij-idea
* atom
* iterm2
* dockertoolbox w/ default VM created.

# OS-X References

* [Google Chrome Mac Shortcut Keys](http://compositecode.com/docs/google-chrome-mac-shortcuts/)
* [Mac OS-X Keys ⌘ (Command), ⌥ (Option), and ^ (Control)](http://compositecode.com/os-x-docs/mac-os-x-keys/)
