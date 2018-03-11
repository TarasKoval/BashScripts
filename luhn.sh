#!/bin/bash
#Given a number determine whether or not it is valid per the Luhn formula.

if [[ $# -ne 1 ]]; then
	echo false
	exit 0
fi

line=`echo $1 | tr -d ' '`

if ! [[ $line =~ ^[0-9]+$ ]]; then
	echo false
	exit 0
fi

for ((iter=${#line}-1; iter>0; iter-=2))
do
	first=`echo ${line:0:$iter-1}`
	middle1=`echo $line | cut -c$iter`
	last=`echo ${line:$iter}`
	
	middle2=$(($middle1*2))
	if [[ $middle2 -gt 9 ]]; then
		middle2=$(($middle2-9))
	fi

	line="$first$middle2$last"
done

sum=0

for ((iter=${#line}-1; iter>=0; iter-=1))
do
	temp=`echo ${line:$iter:1}`
	sum=$(($sum+$temp))
done

if [[ $(($sum%10)) == 0 ]] && [[ "$line" != "0" ]]; then
	echo true
else 
	echo false
fi