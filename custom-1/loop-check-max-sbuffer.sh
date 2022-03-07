#!/bin/bash

#What is Max capacity of a String Variable?
#In this script we will check the lenght and show results
BUFFER=''
TOKEN='A'
TLENGHT=1
BLENGHT=0

STAT=1
CNT=1
# Next version will receive token as parameter
#if [[  $1 && $2  &&  $1 -ge $2 && $2 -gt 0 ]]
#then

until [[ 1 && $CNT -gt 10000 ]]
do
	BUFFER="${BUFFER}${TOKEN}"
	echo "BUFFER:\n ${BUFFER}"
	echo "Status : ${?}" 
	BLENGHT=$(expr $BLENGHT + $TLENGHT)
	echo "\nCurrent size of buffer: ${BLENGHT}"
	CNT=$(expr $CNT + 1)
	echo "\nIteration #: ${CNT} "
done
STAT=0

#fi

exit $STAT
