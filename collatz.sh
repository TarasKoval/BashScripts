#!/bin/bash
#If n is even, divide n by 2. If not, multiply n by 3 and add 1. Repeat the process until n = 1.
#Return the number of steps required to reach 1.
set -o errexit
set -o nounset

if [ $# -ne 1 ]
then
	echo "Usage: $0 <number>"
	exit 1
fi

number=$1
if [ $number -lt 1 ]
then
	echo "Error: Only positive numbers are allowed"
	exit 1
fi

iterations=0
while [ $number -gt 1 ]
do
	if [ $(($number%2)) -eq 0 ]
	then
		number=$(($number/2))
	else
		number=$(($number*3+1))
	fi
	iterations=$(($iterations+1))
done

echo $iterations
exit 0