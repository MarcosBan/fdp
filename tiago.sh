#!/bin/bash
clear

#######################FUNÇAO#######################

function CRIARQ(){
   USB=$( dialog --stdout						\
    --title 'Criação de Arquivos ou Diretorios'				\
    --menu 'Deseja criar arquivos ou diretorio?'			\
     0 0)

if [ $USB == "a" ]; then
ARQUIVOS=$( dialog   --stdout						\
    --title 'Criação de Arquivos'				       	\
    --inputbox 'Digite o nome e a extenção que quer para seu arquivos:' \
     0 0)
      cat > $ARQUIVOS

CONCLUIDO=$( dialog --stdout						\
    --title 'Sucesso'							\
    --msgbox 'Arquivo criado com sucesso'				\
     0 0)
elif [ $USB == "d" ]; then
DIRETORIO=$( dialog --stdout						\
    --title 'Criação de Diretorios'					\
    --inputbox 'Digite o nome do seu diretorios'			\
     0 0)
     mkdir $DIRETORIO

CONCLUIDO=$( dialog --stdout						\
   --title 'Sucesso'							\
   --msgbox 'Diretorio criado com sucesso'				\
     0 0)
fi

}
##############################################################
function COARQ(){
    DIG=$( dialog --stdout			        		\
   --title 'Copia de arquivos e diretorios'	        		\
   --inputbox 'Deseja copiar Arquivos(a) ou Diretorios(d)?'		\
     0 0)

if [ $DIG == "a" ]; then
ARQ=$( dialog --stdout				         	\
   --title 'Nome do Arquivo que deseja copiar?'		        \
   --inputbox 'Digite o nome do Arquivo'		        \
     0 0)

COLADO=$( dialog --stdout					\
   --title 'Nome do Diretorio que deseja copiar?'               \
   --inputbox 'Digite o nome do Diretorio'			\
     0 0)
cp $ARQ $COLADO
fi

CONCLUIDO=$( dialog --stdout					\
   --title 'Sucesso'						\
   --msgbox 'Arquivo criado com sucesso'                        \
   0 0)
}
##################################################################
function MRARQ(){
     BABY=$( dialog --stdout					\
     --title 'Mover e renomear'					\
     --inputbox 'Deseja mover Arquivo(a) ou Diretorio(d):'	\
     0 0)
if [ $MOV == "a" ]; then
ARQ=$( dialog --stdout						\
    --titlee 'Mover Arquivos'					\
    --inputbox 'Qual nome do arquivo que deseja mover:'    	\
     0 0)

TITI=$( dialog --stdout						\
    --title 'Mover Arquivos'					\
    --inputbox 'Digite para onde deseja mover o arquivo:'	\
     0 0)
    mv $ARQ $TITI

FRANCISCO=$( dialog --stdout					\
    --title 'Sucesso'						\
    --msgbox 'Arquivo movido com sucesso'			\
     0 0)

if [ $MOV == "d" ]; then
DIR=$( dialog --stdout						\
    --title 'Mover diretorio'					\
    --inputbox 'Digite o nome do diretorio que deseja mover:'   \
     0 0)

PROGRESSO=$( dialog --stdout					\
    --title 'Mover diretorio'					\
    --inputbox 'Digite para onde deseja mover o diretorio:'	\
     0 0)
   mv $DIR $PROGRESSO

MARAVILHA=$( dialog --stdout					\
    --title 'Sucesso'						\
    --msgbox 'Diretorio movido com sucesso'			\
     0 0)
fi
fi

if [ $BAILE == "r" ]; then
RE=$( dialog --stdout						\
    --title 'Renomear'						\
    --inputbox 'Deseja Renomear Arquivos(a) ou Diretorio(d):'	\
     0 0)

elif [ $RE == "a" ]; then
ARQU=$( dialog --stdout						\
    --title 'Renomear Arquivos'					\
    --inputbox 'Qual o nome do arquivo que deseja Renomear:'    \
     0 0)

TI=$( dialog --stdout						\
    --title 'Renomear Arquivos'					\
    --inputbox 'Digite o novo nome do arquivo'			\
     0 0)

BELEZA=$( dialog --stdout					\
    --title 'Sucesso'						\
    --msgbox 'Arquivo Renomeado com Sucesso'			\
     0 0)
elif [ $RE == "r" ]; then
DIRE=$( dialog --stdout						\
    --title 'Renomear Diretorio'				\
    --inputbox 'Qual nome do Diretorio que deseja renomear:'	\
     0 0)

SET=$( dialog --stdout						\
    --title 'Renomear Diretorio'				\
    --inputbox 'Digite o nome do novo Diretorio:'		\
     0 0)
    mv $DIRE $SET

BELEZA=$( dialog --stdout					\
    --title 'Sucesso'						\
    --msgbox 'Diretorio Renomeado com sucesso'			\
     0 0)

fi
}
###########################################################
function APARQ(){
ARQ=$( dialog --stdout						\
    --title 'Apagar'						\
    --inputbox 'Apagar Arquivo(a) ou Diretorio(d)' 		\
    0 0)

if [ $ARQ == "a" ]; then
MSN=$( dialog --stdout						\
   --title 'Apagar Arquivos'					\
   --inputbox 'Qual nome do arquivo deseja apagar:'		\
    0 0)
      rm -rf $MSN

elif [ $ARQ == "d" ]; then
OI=$( dialog --stdout						\
   --title 'Apagar diretorio'					\
   --inputbox 'Qual nome do diretorio que deseja apagar:'	\
    0 0)
      rm -rf $OI
fi
}

MENU=$( dialog --stdout						\
   --title 'Gerenciamentos de arquivos'				\
   --menu 'Escolha uma opção'				\
    0 0 0							\
1 'Criar arquivos e diretorios'					\
2 'Copiar arquivos e diretorios'				\
3 'Mover ou renomear arquivos e diretorios'			\
4 'Apagar arquivos e diretorios'				\
5 'Backup'							\
6 'Voltar')							\

case $MENU in

1)CRIARQ ;;
2)COARQ ;;
3)MRARQ ;;
4)APARQ ;;
5)BKARQ ;;
6)echo; exit 0 ;;
esac
