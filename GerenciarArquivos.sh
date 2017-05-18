#!/bin/bash
clear

function CARQ(){


ARQ=$(dialog   --stdout					\
		--title	'Nome do arquivo que deseja copiar'	\
		--inputbox 'insira o nome do arquivo'		\
0 0)

SELECIONAR=$(dialog   --stdout					\
		--title	'Nome do diretorio onde deseja copiar'	\
		--inputbox 'insira o nome do diretorio'		\
0 0)

cp $ARQ $SELECIONAR

SUCESSO=$(dialog --stdout		\
		--title 'Sucesso'              \
		--msgbox 'Copiado com sucesso' \
		0 0)

}
#---------------------------------------------------------
function RA(){
echo "O bagulho é loko memo"
echo "Pressione a porcaria de uma tecla"
read XXX
}


MENU=$(dialog --stdout                          \
	--title 'Gerenciamento de Arquivo'	\
	--menu   'Escolha uma opçao'		\
	0 0 0					\
 1 'Copiar arquivos'			        \
 2 'Remover Arquivos'			        \
 3 'Backup de Arquivos'				\
 4 'Voltar')				        

case $MENU in

  1)CARQ ;;
  2)RA ;;
  3)BA ;;
  4)clear ;;
  *)read ppp 

esac






