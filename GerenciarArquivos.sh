#!/bin/bash
clear
######################### Função secundaria ###########################



######################### FUNÇÃO ######################################
function CRIARQ(){
	QNT=$(dialog 	--stdout				\
	--title 'Criação do Arquivo ou diretorio'		\
	--menu 'Deseja criar arquivo(a) ou diretorio(d)? '	\
	0 0 0							\
	1 'Criar arquivo'					\
	2 'Criar diretorio'					\
	3 'Voltar')
if [ $QNT == "1" ]; then 
ARQUIVO=$(dialog	--stdout				     \
--title 'Criação de arquivo'					     \
--inputbox 'Digite o nome e a extenção que deseja para seu arquivo:' \
0 0)
		cat > $ARQUIVO

elif [ $QNT == "2" ]; then
DIRETORIO=$( dialog	--stdout				\
--title 'Criação de Diretorio'					\
--inputbox 'Digite o nome do Diretorio desejado ?'		\
0 0)
	mkdir $DIRETORIO
fi

}
#-----------------------------------------------------------------------
function COARQ(){
	DIG=$( dialog --stdout					\
		--title 'Copia de Arquivo ou diretorio'		\
		--inputbox 'Deseja copiar arquivo(a) ou diretorio(d)?'\
		0 0)
ARQ=$( dialog   --stdout					\
		--title	'Nome do arquivo que deseja copiar'	\
		--inputbox 'insira o nome do arquivo'		\
		0 0)

SELECIONAR=$( dialog   --stdout					\
		--title	'Nome do diretorio onde deseja copiar'	\
		--inputbox 'Insira o nome do diretorio'		\
		0 0)

cp $ARQ $SELECIONAR

fi

}
#----------------------------------------------------------------------#
function MRARQ(){
	BABY=$( dialog --stdout					\
	--title 'Mover ou Renomear '				\
	--menu 'Deseja Mover ou Renomear ? '			\
	0 0 0							\
	1 'Mover'						\
	2 'Renomear'						\
	3 'Voltar')

if [ $BABY == 1 ]; then
 MOV=$( dialog   --stdout					\
	--title	'Tipo de arquivo'				\
	--menu 'Selecione o tipo'				\
	0 0 0							\
	1 'Arquivo'						\
	2 'Diretorio'						\
	3 'Voltar')
	if [ $MOV = 1 ]; then 
	
	fi
fi
fi
	elif [ $BABY = 1 ]; then
		RE=$( dialog   --stdout				\
	--title	'Renomear'					\
	--inputbox 'Deseja Renomear Arquivo(A) ou Diretorio(D):' \
		0 0)
	if [ $RE == "A" ]; then 
 	 ARQU=$( dialog --stdout				\
	--title 'Renomear Arquivos'				\
	--inputbox 'Qual o nome do arquivo que deseja Renomear:'\
		0 0)
	PA=$( dialog --stdout 					\
		--title 'Renomear Arquivos'			\
		--inputbox 'Digite o novo nome do arquivo :'	\
		0 0)
		mv $ARQU $PA

	PERFEITO=$( dialog --stdout				\
		--title 'Sucesso'              			\
		--msgbox 'Arquivo renomeado com sucesso'	\
		0 0)

	elif [ $RE == "D" ]; then 
	 DIRE=$( dialog --stdout				\
--title 'Renomear Diretorio'					\
--inputbox 'Qual o nome do Diretorio que deseja Renomear:'	\
		0 0)
	NOV=$( dialog --stdout 					\
	--title 'Renomear Diretorio'				\
	--inputbox 'Digite o novo nome para o Diretorio :'	\
	0 0)
		mv $DIRE $NOV

   MARAVILHA=$( dialog --stdout					\
		--title 'Sucesso'              			\
		--msgbox 'Diretorio renomeado com sucesso' 	\
		0 0)
fi
fi
}
#----------------------------------------------------------------------#
function APARQ(){
ARQ=$( dialog   --stdout					\
		--title	'Apagar '				\
		--inputbox 'Apagar Arquivo(A) ou Diretorio(D) ?'\
		0 0)
if [ $ARQ == "A" ]; then
	QU=$( dialog --stdout 					\
	--title 'Apagar Arquivo'				\
	--inputbox 'Qual o nome do arquivo que deseja apagar :'	\
	0 0)
	rm -rf $QU
 elif [ $ARQ == "D" ]; then 
   QUAL=$( dialog --stdout					\
    --title 'Apagar Diretorio'					\
    --inputbox 'Qual o nome do diretorio que deseja apagar :'	\
    0 0)
	rm -rf $QUAL
fi
}

#function BKARQ(){
#}

MENU=$(dialog --stdout                          \
	--title 'Gerenciamento de Arquivo'	\
	--menu   'Escolha uma opçao'		\
	0 0 0					\
 1 'Criar arquivos e diretorios'		\
 2 'Copiar arquivos e diretorios'		\
 3 'Mover ou renomear arquivos e diretorios'	\
 4 'Apagar arquivos e diretorios'		\
 5 'Backup'					\
 6 'Voltar')					\

case $MENU in

  1) CRIARQ ;;
  2) COARQ ;;
  3) MRARQ ;;
  4) APARQ ;;
  5) BKARQ ;;
 #6) echo; exit 0 ;; 
esac
