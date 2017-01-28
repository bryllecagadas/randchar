#!/bin/bash
# Filename: randchar.sh
# Author:   Brylle Cagadas
# Usage:    randchar.sh [length]
#           Creates a random string with optional [length] with default length of 20.

COUNT=${1-20}
STR=""
for i in $(seq 1 $COUNT)
do
	NUM=$(( $RANDOM % 62 ))
	if [ 9 -ge $NUM ]; then # 0-9 starts at 48
		NUM=$(($NUM + 48))
	elif [ 35 -ge $NUM ]; then # a-z starts at 97
		NUM=$(($NUM + 87))
	elif [ 61 -ge $NUM ]; then # A-Z starts at 65
		NUM=$(($NUM + 29))
	fi
	CHAR=$(printf "\x$(printf %x $NUM)")
	STR=$STR$CHAR
done

echo $STR