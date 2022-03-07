#!/bin/bash

# Browse dir for specific files, scan its content and outputs it
#

##

cscan() {
bname=''
for F in $@
do
if [[ -f $F ]]
then
echo $F
bname=$(basename $F)

cat $bname >> $DATA
fi
done	
	
	
}

#

DIR=$(ls *.txt)
NAMES='a | b | c'
DATA='cscan.out'
touch $DATA
cscan $DIR 
echo 'Got this data:'
cat $DATA

rm -f $DATA
exit 0
