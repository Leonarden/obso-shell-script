#!/bin/bash

#Basic numeric selection

STAT=-1
MAX="A"
VAL=-10

echo " 3 Numbers as parameters: X Y Z "

if [[ $1 && $2 && $3 ]]
then
	STAT=0
	if [[ $1 -le $2 ]]
	then
		echo " X <= Y "
		MAX="Y"; VAL=$2	
	else
		echo " X is greater than Y "
		MAX="X"; VAL=$1
	fi
	if [[ $1 -le $3 ]]
	then
		echo " X <= Z "
		MAX="Z"; VAL=$3
	else
		echo " X is greater than Z "
		MAX="X"; VAL=$1
	fi
	if [[ $2 -gt $VAL ]]
	then
		echo " Y greater than ${MAX}  "
		MAX="Y"; VAL=$2
	fi
			
fi
if [[ $STAT -eq 0 ]]
then
	echo "The bigger number is: ${MAX} with value ${VAL} "
else
	echo " Something failed "
fi
echo $STAT

exit $STAT
