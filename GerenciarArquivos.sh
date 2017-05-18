#!/bin/bash
clear
function CRIARQ(){
}

function CARQ(){


ARQ=$(dialog   --stdout					\
		--title	'Nome do arquivo que deseja copiar'	\
		--inputbox 'insira o nome do arquivo'		\
0 0)

SELECIONAR=$(dialog   --stdout					\
		--title	'Nome do diretorio onde deseja copiar'	\
		--inputbox 'Insira o nome do diretorio'		\
0 0)

cp $ARQ $SELECIONAR

SUCESSO=$(dialog --stdout		\
		--title 'Sucesso'              \
		--msgbox 'Copiado com sucesso' \
		0 0)

}
#---------------------------------------------------------
function MRARQ(){

ARQ=$(dialog   --stdout						\
		--title	'Nome do arquivo que deseja remover'	\
		--inputbox 'Insira o nome do arquivo'		\
0 0)

rm $ARQ
}

function APARQ(){
ARQ=$(dialog   --stdout						\
		--title	'Nome do arquivo que deseja remover'	\
		--inputbox 'Insira o nome do arquivo'		\
0 0)

rm $ARQ

}

function BKARQ(){
}

MENU=$(dialog --stdout                          \
	--title 'Gerenciamento de Arquivo'	\
	--menu   'Escolha uma opçao'		\
	0 0 0					\
 1 'Criar arquivos e diretorios'
 2 'Copiar arquivos e diretorios'
 3 'Mover ou renomear arquivos e diretorios'
 4 'Apagar arquivos e diretorios'
 5 'Backup'
 6 'Sair')

case $MENU in

  1)CRIARQ ;;
  2)CARQ ;;
  3)MRARQ ;;
  4)APARQ ;;
  5)BKARQ ;;
  6)SAIR ;; 

esac






