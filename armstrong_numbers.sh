#!/bin/bash
#Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.
#example: 153 is an Armstrong number, because: `153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153`
if [ $# -ne 1 ]
	then 
	echo "Usage: $0 <number>"
	exit 1
fi

number=$1
index=1
suma=0
length=${#number}
while [ $index -le $length ]
do
	temp=`echo $number | cut -c${index}`
	suma=$(expr $suma + $(($temp**$length)))
	index=$(($index+1))
done

if [ $suma -eq $number ]
	then 
	echo "true"
	exit 0
else
	echo "false"
	exit 1
fi