#!/bin/bash

trim() {
	# https://stackoverflow.com/a/3352015/6124544

	local STRING="$*"

	STRING="${STRING#"${STRING%%[![:space:]]*}"}" # remove leading whitespace characters
	STRING="${STRING%"${STRING##*[![:space:]]}"}" # remove trailing whitespace characters

	printf '%s' "$STRING"
}

sanitize() {
	local STRING="$*"

	STRING="$(echo "$STRING" | tr -d '\n')" # remove newline (https://stackoverflow.com/a/19345966/6124544)
	STRING="$(echo "$STRING" | awk '{print tolower($0)}')" # convert to lowercase (https://stackoverflow.com/a/2264537/6124544)
	STRING="$(echo "$STRING" | awk '{$2=$2};1')" # remove duplicate spaces (https://unix.stackexchange.com/a/145981)
	STRING=${STRING//ä/ae} # ä -> ae
	STRING=${STRING//ö/oe} # ö -> oe
	STRING=${STRING//ü/ue} # ü -> ue
	STRING=${STRING//ß/ss} # ß -> ss
	STRING=$(trim "$STRING")
	STRING="${STRING// /_}" # <space> -> _
	STRING="$(echo "$STRING" | sed -e 's/[^\.a-zA-Z0-9_-]//g')" # remove remaining trash-characters (https://stackoverflow.com/a/13043397/6124544)

	printf '%s' "$STRING"
}

# --- AUTHORS ---

authors=()

while : ; do
	read -r -p "author: " AUTHOR

	AUTHOR=$(sanitize $AUTHOR)

	authors+=($AUTHOR)

	if [ -z "${AUTHOR}" ]; then
		if (( ${#authors[@]} < 1 )); then
			echo "AT LEAST ONE AUTHOR REQUIRED"
			continue
		fi
		break
	fi
done

authors_str=""

for a in "${authors[@]}"
do
	authors_str+="${a} "
done

authors_str=$(sanitize $authors_str)

# --- YEAR ---

while : ; do
	read -r -p "year: " YEAR

	if ! [[ $YEAR =~ ^[0-9]+$ ]]; then
		echo "NaN"
		continue
	fi

	if (( $YEAR < 1800 || $YEAR > 2100 )); then
		echo "UNPLAUSIBLE YEAR"
		continue
	fi

	break
done

# --- TITLE ---

read -r -p "title: " TITLE

TITLE=$(sanitize $TITLE)

# ----------

DIR=$(sanitize "${authors_str} ${YEAR} ${TITLE}")
COLOR_DIR="$(tput setaf 6)$(tput bold)${DIR}$(tput sgr 0)"

read -r -p "Create ${COLOR_DIR} ? [Y/n] " RESPONSE
RESPONSE=${RESPONSE,,} # tolower
if [[ "$RESPONSE" =~ ^(no|n)$ ]]; then
	exit 0
fi

mkdir $DIR
echo $DIR
