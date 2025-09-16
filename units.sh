#!/bin/sh

if [ $# -eq 2 ]; then 
	units --strict "$1" "$2" | awk -v left="$1" -v right="$2" \
		'$1 == "*" {print left, "=", $2, "*", right}; \
     $1 == "/" { print $2, "*", left, "=", right};' | column -t -s= -o= -R 1
else
	printf "Usage: $0 'N unit1' 'M unit2'\nwhere N and M are optional numbers, and the two units are convertible to one another.\n$0 will use the 'units' program ($(units --terse --version))\nto make the two units you provide equal - if that is possible.\n\nUNITS:\n\n"
	units --version
fi
