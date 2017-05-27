#!/bin/bash
ATPCT(){
AT=$( dialog --stdout	--yes-label Sim	--no-label Não	\
	--title 'Atualização de pacotes'			\
	--yesno ' Deseja realmente atualizar todos os pacotes ?'\
	0 0) 
AT=$?
if [ $AT = 0 ]; then 
	apt-get update > TRASH 

#else 
#	DIG
fi

}

INPCT(){
PA=$( dialog --stdout					\
	--title 'Instalação de pacotes'				\
	--inputbox 'Qual o nome do pacote que deseja instalar? '\
	0 0)
	apt-get install $PA > TRASH
}

DNPCT(){
RE=$( dialog --stdout					\
	--title 'Remoção de pacotes'				\
	--inputbox 'Qual o nome do pacote que deseja remover? '	\
	0 0)
	apt-get autoremove $RE --purge > TRASH
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
