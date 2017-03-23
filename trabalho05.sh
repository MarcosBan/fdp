#!/bin/bash
MENOR=0
MAIOR=0
MEDIO=0
NUM=1
while (($NUM != 0)); do
	echo "Digite um salário"
	read SAL
	TEMP=$(echo "scale=2; $SAL > $MENOR || $SAL > $MEDIO || $SAL > $MENOR" | bc)
	echo "$TEMP"
	if (($TEMP == 1)); then
		TEMP_S=$SAL
	fi
TEMP=$(echo "scale=2; $TEMP_S > $MAIOR" | bc)
	if (($TEMP == 1)); then
		TEMP_MAIOR=$MAIOR
		MAIOR=$TEMP_S
	else
		TEMP_MAIOR=$TEMP_S
	fi 




TEMP=$(echo "scale=2; $TEMP_MAIOR > $MEDIO && $TEMP_MAIOR < $MAIOR" | bc)
	if (($TEMP == 1)); then
		TEMP_MEDIO=$MEDIO
		MEDIO=$TEMP_MAIOR
	else
		TEMP_MEDIO=$TEMP_MAIOR
	fi


TEMP=$(echo "scale=2; $TEMP_MEDIO > $MENOR && $TEMP_MEDIO < $MEDIO" | bc)
	if (($TEMP == 1)); then
		MENOR=$TEMP_MENOR
	fi
TEMP=$(echo "scale=2; $SAL > 0.00" | bc) 
	if (($TEMP == 0)); then
		NUM=0
	else
		NUM=1000
	fi
done
echo "$MENOR , $MEDIO, $MAIOR"
TEMP=$(echo "scale=2; $MENOR > 0.00" | bc)
if (($TEMP == 1)); then
	echo "Esse eh o menor numero: " $MENOR
fi

TEMP=$(echo "scale=2; $MEDIO > 0.00" | bc)
if (($TEMP == 1)); then
	echo "Esse eh o medio: " $MEDIO
fi

TEMP=$(echo "scale=2; $MAIOR > 0.00" | bc)	
if (($TEMP == 1)); then
	echo "Esse eh o maior numero: " $MAIOR
fi

