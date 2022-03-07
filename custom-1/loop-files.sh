#!/bin/bash

#Basic use of for loop

STAT=1

LIST=`ls *.txt`

for FILE in $LIST
do
cat $FILE
done

exit ${?}
