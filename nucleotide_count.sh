#!/bin/bash
#Given a single stranded DNA string, compute how many times each nucleotide occurs in the string.
set -o errexit
set -o nounset

if [[ $# -ne 1 ]]; then
	echo "usage: $0 <\"parametres\">"
	exit 0
fi

line=$1

correctPattern="^[ACGT]*$"
if ! [[ $line =~ $correctPattern ]]; then
	echo "Invalid nucleotide in strand"
	exit 1
fi

length=${#line}
nA=0
nC=0
nG=0
nT=0

for ((iter=0; iter<$length; iter++))
do
	char=`echo ${line:$iter:1}`
	
	if [[ $char == "A" ]]; then
		nA=$(($nA+1))	
	elif [[ $char == "C" ]]; then
		nC=$(($nC+1))	
	elif [[ $char == "G" ]]; then
		nG=$(($nG+1))	
	else
		nT=$(($nT+1))
	fi
done

echo "A: $nA\nC: $nC\nG: $nG\nT: $nT"
exit 0