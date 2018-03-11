#!/bin/bash

list=`ls`
wordtoremove="MAINTEST.sh"
list=${list//$wordtoremove/}

RED='\033[0;31m'
GREEN='\033[0;32m'

for word in $list
do
	bats -t $word > /dev/null
	if [[ $? == 0 ]]; then
		echo -e "${GREEN} all tests passed in  $word"
	else
		echo -e "${RED}some tests failed in  $word"
	fi
	
done
