#!/bin/bash

# Helper-script, that installs/reinstalls/uninstalls every stow-module inside a configured directory

STOW_DIR="${STOW_DIR:-config/}" # Directory to stow from
STOW_TARGET="${STOW_TARGET:-../../}" # Directory to stow into, relative from STOW_DIR
OPERATION="${1:-reinstall}" # Operation (uninstall, install, reinstall)

function install() {
	echo "install $1"
	stow \
		-S \
		-t $STOW_TARGET \
		$1
}

function reinstall() {
	echo "reinstall $1"
	stow \
		-R \
		-t $STOW_TARGET \
		$1
}

function uninstall() {
	echo "uninstall $1"
	stow \
		-D \
		-t $STOW_TARGET \
		$1
}

pushd $STOW_DIR > /dev/null
if [[ "$OPERATION" == "uninstall" ]]; then
	for dir in */; do
		uninstall $dir
	done
elif [[ "$OPERATION" == "install" ]]; then
	for dir in */; do
		install $dir
	done
elif [[ "$OPERATION" == "reinstall" ]]; then
	for dir in */; do
		reinstall $dir
	done
fi
popd > /dev/null
