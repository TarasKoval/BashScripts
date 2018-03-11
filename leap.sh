#!/bin/bash
#Given a year, report if it is a leap year.
set -o errexit
set -o nounset

if [[ $# -ne 1 ]]; then
	echo 'Usage: leap.sh <year>'
	exit 1
fi

number=$1

if ! [[ $number =~ ^[0-9]+$ ]]; then
	echo 'Usage: leap.sh <year>'
	exit 1
fi

if [[ $(($number%4)) == 0 ]] && [[ $(($number%100)) != 0 ]] || [[ $(($number%400)) == 0 ]]; then
	echo true
else
	echo false
fi

exit 0
