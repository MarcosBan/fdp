#!/bin/bash
clear
######################### FUNÇÃO ##########################################
function CRIARQ(){
	QNT=$(dialog 	--stdout				\
	--title 'Criação do Arquivo ou diretorio'		\
	--inputbox 'Deseja criar arquivo(a) ou diretorio(d)? '	\
	0 0)
#--------------------------------------------------------------------------#
if [ $QNT == "a" ]; then 
ARQUIVO=$(dialog	--stdout				     \
--title 'Criação de arquivo'					     \
--inputbox 'Digite o nome e a extenção que deseja para seu arquivo:' \
0 0)
		cat > $ARQUIVO

	PARABENS=$(dialog --stdout				\
		--title 'Sucesso'              			\
		--msgbox 'Arquivo criado com sucesso' 		\
		0 0)
elif [ $QNT == "d" ]; then
DIRETORIO=$(dialog	--stdout				\
--title 'Criação de Diretorio'					\
--inputbox 'Digite o nome do Diretorio desejado ?'		\
0 0)
	mkdir $DIRETORIO
PARABENS=$(dialog --stdout					\
		--title 'Sucesso'              			\
		--msgbox 'Diretorio criado com sucesso' 	\
		0 0)
fi
}
#-----------------------------------------------------------------------
function COARQ(){
	DIG=$(dialog --stdout					\
	--title 'Copia de Arquivo ou diretorio'			\
	--inputbox 'Deseja copiar arquivo(a) ou diretorio(d)? '	\
	0 0)
#------------------------------------------------------------------------#
if [ $DIG == "a" ]; then 
ARQ=$(dialog   --stdout						\
		--title	'Nome do arquivo que deseja copiar'	\
		--inputbox 'insira o nome do arquivo'		\
		0 0)

SELECIONAR=$(dialog   --stdout					\
		--title	'Nome do diretorio onde deseja copiar'	\
		--inputbox 'Insira o nome do diretorio'		\
		0 0)

cp $ARQ $SELECIONAR

SUCESSO=$(dialog --stdout					\
		--title 'Sucesso'              			\
		--msgbox 'Arquivo copiado com sucesso' 		\
		0 0)
#elif [ $DIG == "d" ]; then
#DIR=$(dialog   --stdout						\
#		--title	'Nome do diretorio que deseja copiar'	\
#		--inputbox 'insira o nome do diretorio:'	\
#		0 0)
#
#SELECIONAR=$(dialog   --stdout					\
#		--title	'Nome do diretorio onde deseja copiar'	\
#		--inputbox 'Insira o nome do diretorio'		\
#0 0)
#
#cp $DIR $SELECIONAR
#
#SUCESSO=$(dialog --stdout					\
#		--title 'Sucesso'              			\
#		--msgbox 'Diretorio copiado com sucesso' 	\
#		0 0)
fi
}
#----------------------------------------------------------------------#
function MRARQ(){
	BABY=$(dialog --stdout					\
	--title 'Mover ou Renomear '				\
	--inputbox 'Deseja Mover(M) ou Renoamear(R) ? '		\
	0 0)
#-----------------------------------------------------------------------#
if [ $BABY == "M" ]; then
 MOV=$(dialog   --stdout					\
	--title	'Mover'						\
	--inputbox 'Deseja Mover Aquivo(A) ou Diretorio(D) : '	\
		0 0)
	if [ $MOV == "A" ]; then 
 	 AR=$(dialog --stdout					\
	--title 'Mover Arquivos'				\
	--inputbox 'Qual o nome do arquivo que deseja mover :'	\
	0 0)
	ON=$(dialog --stdout 					\
	--title 'Mover Arquivos'				\
	--inputbox 'Digite para onde deseja mover o arquivo :'	\
	0 0)
		mv $AR $ON

	PERFEITO=$(dialog --stdout				\
		--title 'Sucesso'              			\
		--msgbox 'Arquivo movido com sucesso' 		\
		0 0)
#----------------------------------------------------------------------#
	elif [ $MOV == "D" ]; then 
	 DI=$(dialog --stdout					\
	--title 'Mover Diretorio'				\
	--inputbox 'Qual o nome do Diretorio que deseja mover :'\
		0 0)
	LO=$(dialog --stdout 					\
	--title 'Mover Diretorio'				\
	--inputbox 'Digite para onde deseja mover o Diretorio :'\
	0 0)
		mv $DI $LO

   MARAVILHA=$(dialog --stdout					\
	--title 'Sucesso'	              			\	
	--msgbox 'Diretorio movido com sucesso' 		\
		0 0)
fi
fi
	if [ $BABY = "R" ]; then
		RE=$(dialog   --stdout				\
	--title	'Renomear'					\
	--inputbox 'Deseja Renomear Arquivo(A) ou Diretorio(D):' \
		0 0)
	if [ $RE == "A" ]; then 
 	 ARQU=$(dialog --stdout					\
	--title 'Renomear Arquivos'				\
	--inputbox 'Qual o nome do arquivo que deseja Renomear:'\
		0 0)
	PA=$(dialog --stdout 					\
		--title 'Renomear Arquivos'			\
		--inputbox 'Digite o novo nome do arquivo :'	\
		0 0)
		mv $ARQU $PA

	PERFEITO=$(dialog --stdout				\
		--title 'Sucesso'              			\
		--msgbox 'Arquivo renomeado com sucesso'	\
		0 0)
#---------------------------------------------------------------------#
	elif [ $RE == "D" ]; then 
	 DIRE=$(dialog --stdout					\
--title 'Renomear Diretorio'					\
--inputbox 'Qual o nome do Diretorio que deseja Renomear:'	\
		0 0)
	NOV=$(dialog --stdout 					\
	--title 'Renomear Diretorio'				\
	--inputbox 'Digite o novo nome para o Diretorio :'	\
	0 0)
		mv $DIRE $NOV

   MARAVILHA=$(dialog --stdout					\
		--title 'Sucesso'              			\
		--msgbox 'Diretorio renomeado com sucesso' 	\
		0 0)
fi
fi
}
#----------------------------------------------------------------------#
function APARQ(){
ARQ=$(dialog   --stdout						\
		--title	'Apagar '				\
		--inputbox 'Apagar Arquivo(A) ou Diretorio(D) ?'\
		0 0)
if [ $ARQ == "A" ]; then
	QU=$(dialog --stdout 					\
	--title 'Apagar Arquivo'				\
	--inputbox 'Qual o nome do arquivo que deseja apagar :'	\
	0 0)
	rm -rf $QU
 elif [ $ARQ == "D" ]; then 
   QUAL=$(dialog --stdout					\
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






