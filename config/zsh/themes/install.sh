#!/bin/bash

DIR="$(dirname $(realpath $0))"

export ZSH="/usr/share/oh-my-zsh"

pushd $DIR > /dev/null
for theme in *.zsh-theme; do
	ln -s "$DIR/$theme" "$ZSH/themes/$theme"
done
popd > /dev/null
