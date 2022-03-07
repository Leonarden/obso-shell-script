#!/bin/bash

#Script reads 2 input numbers N and F(factor)
# it displays each factor from N
FACTORI=$1
STAT=1
CNT=1
if [[  $1 && $2  &&  $1 -ge $2 && $2 -gt 0 ]]
then

while [[ $FACTORI -ge 1 && $CNT -le 10000 ]]
do
	FACTORI=$(expr $FACTORI / $2)
	echo "Factor# ${CNT} Of ${1} : ${FACTORI}"
	CNT=$(expr $CNT + 1)
done
STAT=0
fi

exit $STAT
