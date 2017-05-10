#!/bin/bash

#########################################################################
TROCA(){ 
TMP=${ARRAY[$1]}
ARRAY[$1]=${ARRAY[$2]}
ARRAY[$2]=$TMP
}
COLETA_DE_VALORES(){
read -p "Digite um valor: " ARRAY
	CONT=$ARRAY
	INT=1	

 while (( CONT != 0 )); do
	read -p "Digite um valor: " ARRAY[$INT]
	CONT=${ARRAY[$INT]}
	let INT=$INT+1
 done
}	


COLOCANDO_EM_ORDEM(){
for (( ULT=CONTAR-1;ULT>0;ULT-- )); do
	for (( I=0;I<ULT;I++)); do
	J=$((I+1))
		if (( ${ARRAY[I]} -gt ${ARRAY[J]} )); then
		TROCA	$I $J
		fi
	done
done
}
########################################################################
COLETA_DE_VALORES

CONTAR=${#ARRAY[@]}

COLOCANDO_EM_ORDEM

echo ${ARRAY[*]}
