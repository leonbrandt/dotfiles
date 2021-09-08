#!/bin/bash

# Installs every package in a given package-list-file (delimited by newline) via pacman. Skips packages that are already installed.

PACKAGES_LIST_DIRECTORY="${PACKAGES_LIST_DIRECTORY:-package-lists/}" # Directory to search for package-lists
SKIP_LISTS="${SKIP_LISTS:-}" # Lists to skip. Example: "list1,list2,list3"

function install_list() {
	while IFS= read -r line; do
		sudo pacman -S --needed --noconfirm "$line"
	done < "$1"
}

pushd $PACKAGES_LIST_DIRECTORY > /dev/null
for list in *; do
	if [[ $list =~ (^|,)"$SKIP_LISTS"(,|$) ]]; then
		echo "skipping $list"
	fi
	echo "installing $list"
	install_list $list
done
popd > /dev/null
