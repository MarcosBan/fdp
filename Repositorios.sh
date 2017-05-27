#!/bin/bash
ATPCT(){

}

INPCT(){

}

DNPCT(){

}


CENTRAL=$( dialog --stdout 		     \
		--title "Menu repositorios"  \
		--menu "Selecione uma opção" \
		0 0 0			\
		1 'Atualizar pacotes'	\
		2 'Instalar pacotes'	\
		3 'Desinstalar pacotes'	\
		4 'Voltar')
case $CENTRAL in
	1) ATPCT ;;
	2) INPCT ;;
	3) DNPCT ;;
	#4)
esac
