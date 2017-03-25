$#!/bin/bash
cont=0
while= (( $cont != 2 ));do
	echo "escolha uma opcao: "
	echo "1- Ler salarios"
	echo "2- Sair"
	echo -n "Entre com uma opcao: "
	read cont
		if (($cont ==1 ));then
			echo -n "digite seu salario: "
			read SAL
			if (($SAL <= 500)); then 
			SAL=$(echo "scale=2; $SAL*1.20" | bc )
			echo "O seu novo salario eh: " $SAL
		else
			SAL=$(echo "scale=2; $SAL*1.10" | bc )
			echo "O seu novo salario eh: " $SAL					
			fi
		fi
done
