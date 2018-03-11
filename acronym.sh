#!/bin/bash
#Convert a phrase to its acronym.
#example: "First In, First Out" => "FIFO"

if [ $# -ne 1 ]
	then
	echo "Usage: $0 <\"parametres\">"
	exit 1
fi

parametrs=`echo $1 | tr '-' ' '`
output=""

for word in $parametrs
do
	output+=`echo $word | head -c 1 | tr [:lower:] [:upper:]`
done

echo $output
exit 0