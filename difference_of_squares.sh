#!/bin/bash
#Find the difference between the square of the sum and the sum of the squares of the first N natural numbers.
#key "-s" return sum of squares
#key "-S" return square of sum

if [ $# -eq 0 ]
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

almostSquareOfSum=0
sumOfSquares=0

for ((iter=1;iter<=$number;iter++))
do
	almostSquareOfSum=$(($almostSquareOfSum+$iter))
	sumOfSquares=$(($sumOfSquares+$(($iter*$iter))))
done

squareOfSum=$(($almostSquareOfSum*$almostSquareOfSum))

if [ $# -eq 1 ]
then
	echo $(($squareOfSum-$sumOfSquares))
fi

if [ $# -eq 2 ]
then
	if [ $2 == "-s" ]
		then
		echo $sumOfSquares
	elif [ $2 == "-S" ]
		then
		echo $squareOfSum
	fi 
fi
