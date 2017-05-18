#!/bin/bash

################################FUNÇÃO#####################################
CAU(){
OP=$( dialog	--stdout			\
		--title 'Usuário '		\
		--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Criar ou apagar usuario' 	\
	2 'Apagar usuário' 		\
	3 'Voltar')
if (( $OP == "1")); then
CRIAR=$( dialog 	--stdout		\
			--title 'Nome do usuário' \
			--inputbox 'Insira o nome do pivet' \
			0 0)


PASS=$( dialog 		--stdout		\
			--title 'Nome do usuário' \
			--inputbox 'INSIRA A SENHA' \
			0 0)

useradd -m -d /home/$CRIAR -r -s /bin/bash $CRIAR
(echo $PASS ; echo $PASS) | passwd $CRIAR

dialog 						\
--title	'WELLDONE'				\
--msgbox 'criado com sucesso' 			\
6 40


elif (( $OP == "2")); then
APAGAR=$( dialog 	--stdout		\
			--title 'Nome do usuário' \
			--inputbox 'Insira o nome do pivet' \
			0 0)

userdel -r $APAGAR

dialog 						\
--title	'WELLDONE'				\
--msgbox 'Apagado com sucesso' 			\
6 40


fi
}
MODU(){
BUSCAR=$( dialog 	--stdout		\
			--title 'Nome do usuário' \
			--inputbox 'Insira o nome do pivet' \
			0 0)
USER=$(grep $BUSCAR /etc/passwd)

dialog	--title 'Confirme' /
		--yesno '\nO $BUSCAR. Este é o usuário que você deseja altera?\n\n' \
7 60
}

CAG(){

OP=$( dialog	--stdout			\
		--title 'Grupos'		\
		--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Criar  Grupo' 	\
	2 'Apagar usuário' 		\
	3 'Voltar')

if (( $OP == "1")); then
CRIAR=$( dialog 	--stdout		\
			--title 'Nome do usuário' \
			--inputbox 'Insira o nome do grupo' \
			0 0)

groupadd $CRIAR

dialog 						\
--title	'WELLDONE'				\
--msgbox 'criado com sucesso' \
6 40


elif (( $OP == "2")); then
APAGAR=$( dialog 	--stdout		\
			--title 'Nome do grupo' \
			--inputbox 'Insira o nome do grupo' \
			0 0)

delgroup $APAGAR

dialog 						\
--title	'WELLDONE'				\
--msgbox 'Apagado com sucesso' \
6 40


fi
}

MODG(){
NOME_U=$( dialog 	--stdout		\
			--title 'Nome do usuário' \
			--inputbox 'Insira o nome do usuário' \
			0 0)

NOME_G=$( dialog 	--stdout		\
			--title 'Nome do grupo' \
			--inputbox 'Insira o nome do grupo' \
			0 0)
}

gpasswd $NOME_U $NOME_G

################################PROGRAMA###################################
OP=$( dialog	--stdout			\
		--title 'Opções para usuário'	\
		--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Criar ou apagar usuario' 	\
	2 'Mudar senha do  usuário'		\
	3 'Criar ou apagar grupos'	\
	4 'Modificar grupos'		\
	5 'Sair')

case $OP in
	1)CAU ;;
	2)MODU ;;
	3)CAG ;;
	4)MODG ;;
	*)echo 'Opção incorreta';;
esac


echo $USER
