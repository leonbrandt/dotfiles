#!/bin/bash

# Helper-script to quickly create directories in the following form: <year>-<month>-<day>_<type>_<keyword(s)>
# Usage: mk <days to add/subsctract>
# Mainly used for organizing my study related files

# Use the following alias to cd automatically into created directories
# alias mk='export X_TMP_DIR=$(\mk) && cd $X_TMP_DIR'

trim() {
	# https://stackoverflow.com/a/3352015/6124544

	local var="$*"
	# remove leading whitespace characters
	var="${var#"${var%%[![:space:]]*}"}"
	# remove trailing whitespace characters
	var="${var%"${var##*[![:space:]]}"}"   
	printf '%s' "$var"
}

DATE_ADD="${1:-0}"
DATE=$(date -d "+${DATE_ADD} days" +'%F')

while [ -z "${TYPE}" ]; do
	read -r -p "Type: " TYPE
done

if [ -z "${KEYWORD}" ]; then
	read -r -p "Keyword(s): " KEYWORD
fi

TYPE="$(echo "$TYPE" | awk '{print toupper($0)}')"

DIR="${DATE}_${TYPE}"

if [ ! -z "${KEYWORD}" ]; then
	KEYWORD="$(echo "$KEYWORD" | tr -d '\n')" # remove newline (https://stackoverflow.com/a/19345966/6124544)
	KEYWORD="$(echo "$KEYWORD" | awk '{print tolower($0)}')" # convert to lowercase (https://stackoverflow.com/a/2264537/6124544)
	KEYWORD="$(echo "$KEYWORD" | awk '{$2=$2};1')" # remove duplicate spaces (https://unix.stackexchange.com/a/145981)
	KEYWORD=${KEYWORD//ä/ae} # ä -> ae
	KEYWORD=${KEYWORD//ö/oe} # ö -> oe
	KEYWORD=${KEYWORD//ü/ue} # ü -> ue
	KEYWORD=${KEYWORD//ß/ss} # ß -> ss
	KEYWORD=$(trim "$KEYWORD")
	KEYWORD="${KEYWORD// /_}" # <space> -> _
	KEYWORD="$(echo "$KEYWORD" | sed -e 's/[^\.a-zA-Z0-9_-]//g')" # remove remaining trash-characters (https://stackoverflow.com/a/13043397/6124544)

	if [ -n ${KEYWORD} ]; then
		DIR="${DIR}_${KEYWORD}"
	fi
fi

COLOR_DIR="$(tput setaf 6)$(tput bold)${DIR}$(tput sgr 0)"

read -r -p "Create ${COLOR_DIR} ? [Y/n] " RESPONSE
RESPONSE=${RESPONSE,,} # tolower
if [[ "$RESPONSE" =~ ^(no|n)$ ]]; then
	exit 0
fi

mkdir $DIR
echo $DIR
