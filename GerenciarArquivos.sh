#!/bin/bash
clear
######################### Função secundaria ###########################
CONFIRM(){
TMP=$?
if (( $TMP == 0 )); then
	dialog --stdout --infobox "Realizado com sucesso" 0 0
elif (( $TMP == 1)); then
	dialog --stdout --infobox "Processo não realizado tente novamente" 0 0 3
fi

}

######################### FUNÇÃO ######################################
CRIARQ(){
VZS=1
while (( $VZS != 0 )); do
	QNT=$( dialog 	--stdout				\
	--title 'Criar'						\
	--menu 'Deseja criar Arquivo ou Diretorio?'		\
	0 0 0							\
	1 'Criar arquivo'					\
	2 'Criar diretorio'					\
	3 'Voltar')
if [ $QNT == 1 ]; then 
ARQUIVO=$( dialog	--stdout				     \
--title 'Criação de arquivo'					     \
--inputbox 'Digite o nome e a extenção que deseja para seu arquivo:' \
0 0)
		> $ARQUIVO
	#CONFIRM
elif [ $QNT == 2 ]; then
DIRETORIO=$( dialog	--stdout				\
--title 'Criação de Diretorio'					\
--inputbox 'Digite o nome do Diretorio desejado ?'		\
0 0)
		mkdir $DIRETORIO
	#CONFIRM

fi
done
LOBY
}
#-----------------------------------------------------------------------
COARQ(){
VZS=1
while (( $VZS != 0 )); do
OPIS=$( dialog --stdout                                 	\
        --title 'Tipo'                            		\
        --menu 'Deseja copiar Arquivo ou Diretorio? '           \
        0 0 0                                                   \
        1 'Mover'                                               \
        2 'Renomear'                                            \
        3 'Voltar')
if [ $OPIS == 1 ]; then
	ARQ=$( dialog   --stdout					\
			--title	'Nome do arquivo que deseja copiar'	\
			--inputbox 'insira o nome do arquivo'		\
			0 0)

	SELEC=$( dialog   --stdout					\
			--title	'Nome do diretorio onde deseja copiar'	\
			--inputbox 'Insira o nome do diretorio'		\
			0 0)

		cp $ARQ $SELECIONAR
		#CONFIRM
elif [ $OPIS == 2 ]; then
	DIR=$( dialog   --stdout                                        \
                        --title 'Nome do arquivo que deseja copiar'     \
                        --inputbox 'insira o nome do arquivo'           \
                        0 0)

        SELEC=$( dialog   --stdout                                 \
                        --title 'Nome do diretorio onde deseja copiar'  \
                        --inputbox 'Insira o nome do diretorio'         \
                        0 0)
		cp -r $DIR $SELEC
		#CONFIRM

fi
done
LOBY
}
#----------------------------------------------------------------------#
MRARQ(){
	VZS=1
while (( $VZS != 0 )); do
	BABY=$( dialog --stdout					\
	--title 'Mover ou Renomear '				\
	--menu 'Deseja Mover ou Renomear ? '			\
	0 0 0							\
	1 'Mover'						\
	2 'Renomear'						\
	3 'Voltar')

if [ $BABY == 1 ]; then
	ARQD=$( dialog --stdout					\
		--title 'Nome do arquivo ou diretório'		\
		--inputbox 'Insira o nome do arquivo'		\
		0 0)
	CAMI=$( dialog --stdout 						\
		--title 'Diretorio'						\
		--inputbox 'Insira o nome do diretorio ou o caminho até ele.'	\
		0 0)
	mv $ARQD $CAMI
	#CONFIRM
elif [ $BABY == 2 ]; then
	ARQD=$( dialog --stdout                                 \
                --title 'Nome do arquivo ou diretório'          \
                --inputbox 'Insira o nome do arquivo'           \
                0 0)
	NARQD=$( dialog --stdout             		                      \
                --title 'Novo nome do arquivo ou diretório'	              \
                --inputbox 'Insira o novo nome do arquivo ou diretorio'       \
                0 0)

	mv $ARQD $NARQD
	#CONFIRM

fi
done
LOBY
}
#----------------------------------------------------------------------#
APARQ(){
	VZS=1
while (( $VZS != 0 )); do
ARQ=$( dialog   --stdout					\
		--title	'Apagar '				\
		--menu 'Apagar Arquivo ou Diretorio?'		\
		0 0 0						\
		1 'Arquivo'					\
		2 'Diretorio'					\
		3 'Voltar')
if [ $ARQ == 1 ]; then
	APARQ=$( dialog --stdout 					\
	--title 'Apagar Arquivo'				\
	--inputbox 'Qual o nome do arquivo que deseja apagar :'	\
	0 0)
	rm  $APARQ
	#CONFIRM
 
elif [ $ARQ == 2 ]; then 
   	APDIR=$( dialog --stdout					\
    	--title 'Apagar Diretorio'					\
    	--inputbox 'Qual o nome do diretorio que deseja apagar :'	\
    	0 0)
	rm -rf $APDIR
	#CONFIRM

fi
done
LOBY
}

#function BKARQ(){
#}
LOBY(){
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
esac

}
######################Programa##############################
LOBY
