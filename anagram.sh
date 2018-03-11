#!/bin/bash
#Given a word and a list of possible anagrams, select the correct sublist.
#example: "master" "stream pigeon maters" => "stream maters"
if [ $# -ne 2 ]
	then
	echo "Usage: $0 <word> <\"parametres\">"
	exit 1
fi

word=$1
key=`echo $word | tr [:upper:] [:lower:] |fold -w 1 |sort | uniq -c`

parametres=$2

output=""

for param in $parametres
do
	temp=`echo $param | tr [:upper:] [:lower:] |fold -w 1 |sort | uniq -c`
	if [[ "$temp" = "$key" ]] && [[ `echo $word | tr [:upper:] [:lower:]` != `echo $param | tr [:upper:] [:lower:]` ]]
		then
		output="${output} ${param}"

	fi
done
echo $output
exit 0