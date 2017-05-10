#!/bin/bash
################################ Criador #################################
#Autor:Marcos Pereira Silva
#Data:10/05/2017
#Script ler numeros aleátorios e organizalos em ordem crescente. 
################################ Funções #################################
TROCA(){ 								
TMP=${ARRAY[$1]}							
ARRAY[$1]=${ARRAY[$2]}							
ARRAY[$2]=$TMP								
}									
################################ Programa ################################
read -p "Digite um valor: " ARRAY
	CONT=$ARRAY
	INT=1	
	
while (( CONT != 0 )); do
	read -p "Digite um valor: " ARRAY[$INT]
	CONT=${ARRAY[$INT]}
	let INT=$INT+1
done

for (( ULT=CONTAR-1;ULT>0;ULT-- )); do
	for (( I=0;I<ULT;I++)); do
	J=$((I+1))
		if (( ${ARRAY[I]} -gt ${ARRAY[J]} )); then
		TROCA	$I $J
		fi
	done
done

echo ${ARRAY[*]}
################################# FIM ###################################
