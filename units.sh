#!/bin/sh
if [ $# -eq 2 ]; then 
	units "$1" "$2" | awk -v left="$1" -v right="$2" \
		'$1 == "*" {print left, "=", $2, "*", right}; \
     $1 == "/" { print $2, "*", left, "=", right};' | column -t -s= -o= -R 1
else
	printf "Usage: $0 'N unit1' 'M unit2'\nwhere N and M are optional numbers, and the two units are convertible to one another.\n"
fi
