#!/bin/bash

#A script for login in a system
# Usage: ./login-basic.sh valid-username

#Globals

ALLOWED_USERS="'Paul' 'Jenny' 'Sam'"

USERS_PASS="'secret1' 'asecret' 'xxsecret'"

RET=-1
PASS=''
USER=$1

#Functions

#Checks if valid user
#
check_user() {
CNT=0
for U in $ALLOWED_USERS
do
T="${U}" 
echo $U
echo $T
	if [[ $U ]]
	then
	CNT=$(expr $CNT + 1)
	fi
	if [[ $T==$1 ]]
	then
	    break
	fi
	
	
done

if [[ $CNT && $CNT -lt 4 ]]
then
	RET=$CNT
else
   RET=0
fi
 
}
#Authenticates a valid user
#
auth() {

N=0
APASS=""

if [[ ${#} -lt 3 ]]
then
  echo "Auth wrong number of params "
  exit 1
fi
#setting variables
POS=$1
shift
PASS=$1
shift
FRET=$1


for P in $USERS_PASS
do

 if [[ $P ]]
 then
  N=$(expr $N + 1)
	echo "${N}"
 fi
 if [[ "${N}" -eq "${POS}" ]]
 then
	APASS="${P}"
    break
  fi
done
	echo $APASS
	
	if [[ $APASS && $APASS=$1 ]]
	then
	 RET=0 
	 echo '0' >> $FRET
	else
		rm -f $FRET   #FIXME
	fi

	
}

#Start script
#	
check_user $USER

POS=${RET}

echo $POS

if [[ ${POS} -eq 0 ]]
then
 echo "Sorry your user doesn't exist in the system"
 exit -1
else
 while [[ 1 ]]
 do

	read -p "Welcome, Input ${1} password: "  PASS

	FRET="ok-${POS}.txt"
	# if [[ ! $FRET ]]
	# then
	  touch ${FRET}
	# fi

	auth $POS $PASS $FRET
	
	if [[ -f ${FRET}  ]]
	then
	  echo "WELLCOME ${USER}, you are LOGGED IN :"
	  break
	else
		echo "Sorry, incorrect password, try again "
	fi 
	rm -f ${FRET}
 done
fi 	
exit 0

