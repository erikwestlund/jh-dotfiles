#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	
	ln -fs $(pwd)/init/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	ln -fs $(pwd)/init/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	ln -fs $(pwd)/init/vscode/snippets/ ~/Library/Application\ Support/Code/User/snippets
	source $(pwd)/init/ssh-permissions.sh
	chmod +x ~/System/*.sh
chmod +x ~/System/dev/*.sh	
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
