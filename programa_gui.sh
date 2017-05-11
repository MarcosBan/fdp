
#!/bin/bash
######################Comentário###########################
#DATA 27/04/2017					###
#Autor: Marcos Pereira Silva				###
#Retomando a aula de Programação			###
#######################Variaveis###########################
USER="USUARIO"
PASS="123"
#######################Funções############################
function CARQ(){
NOME=$( dialog 					\
	--stdout				\
	--title 'Nome' 				\
	--inputbox 'Digite o nome do Arquivo' 	\
	0 0)
#################################################

> $NOME # Criou o arquivo

#################################################
dialog						\ 
	--title 'Sucesso'			\
	--msgbox 'Arquivo criado com sucesso'	\
	0 0	#Confirmou a criação do arquivo
##################################################
ls -la $(pwd $NOME) > /tmp/lista.txt
dialog --title 'Exibir arquivo criado'		\
	--textbox /tmp/lista.txt		\
	0 0
}

function AARQ () {
NOME=$( dialog 					\
	--stdout				\
	--title 'Nome' 				\
	--inputbox 'Digite o nome do Arquivo' 	\
	0 0)
#################################################

rm -rf $NOME # Apagou o arquivo

#################################################
dialog						\ 
	--title 'Sucesso'			\
	--msgbox 'Arquivo apagado com sucesso'	\
	0 0	#Confirmou a criação do arquivo
##################################################
ls -la $(pwd $NOME) > /tmp/lista.txt
dialog --title 'Exibindo diretorio do arquivo apagado'		\
	--textbox /tmp/lista.txt				\
	0 0
}

function CDIR () {
NOME=$( dialog 					\
	--stdout				\
	--title 'Nome' 				\
	--inputbox 'Digite o nome do diretorio' 	\
	0 0)
#################################################

rm -rf $NOME # Apagou o arquivo

#################################################
dialog						\ 
	--title 'Sucesso'			\
	--msgbox 'Arquivo apagado com sucesso'	\
	0 0	#Confirmou a criação do arquivo
##################################################
ls -la $(pwd $NOME) > /tmp/lista.txt
dialog --title 'Exibindo diretorio do arquivo apagado'		\
	--textbox /tmp/lista.txt				\
	0 0
}

function GARQ (){
#####################################clear
#########################echo "Função GARQ"
#read -p "Pressione [enter] para finalizar" PPP
#######################################MENU
OPCAO=$( dialog 		  		\
	--stdout		  		\
	--title 'Gerenciamento de Arquivo'  	\
	--menu 'Escolha uma opção'		\
	0 0 0					\
1 'Criar Arquivo'				\
2 'Apagar Arquivo'				\
3 'Criar Diretório'				\
4 'Apagar Diretório'				\
5 'Listar Diretório'				\
6 'Voltar')

case $OPCAO in
	1)CARQ ;;
	2)AARQ ;;
	3)CDIR ;;
	4)ADIR ;;
	5)LDIR ;;
	6)echo; exit 0 ;;
	*) read -p 'Opção inválida.'; read p; MENU ;;
esac

}
function GUSR (){
clear
echo "Função GUSR"
read -p "Pressione [enter] para finalizar" PPP
MENU
}
function GRED (){
clear
echo "Função GRED"
read -p "Pressione [enter] para finalizar" PPP
MENU
}
function GDIS (){
clear
echo "Função GDIS"
read -p "Pressione [enter] para finalizar" PPP
MENU
}
function GREP (){
clear
echo "Função GREP"
read -p "Pressione [enter] para finalizar" PPP
MENU
}

function MENU(){
clear
OPCAO=$( dialog 		  	\
	--stdout		  	\
	--title 'Menu Principal'		  	\
	--menu 'Escolha uma opção'	\
	0 0 0				\
1 'Gerenciar Arquivos'			\
2 'Gerenciar Usuarios'			\
3 'Gerenciar Rede'			\
4 'Gerenciar Dispositivos'		\
5 'Gerenciar Repositorios'		\
6 'Sair')

case $OPCAO in
	1)GARQ ;;
	2)GUSR ;;
	3)GRED ;;
	4)GDIS ;;
	5)GREP ;;
	6)echo; exit 0 ;;
	*) read -p 'Opção inválida.'; read p; MENU ;;
esac
}

function SAIR (){
clear
exit 0
}

########################Programa##########################
clear

####################read -p "Digite o nome do seu usuario: " USUARIO
USUARIO=$(dialog 					\
	--stdout					\
	--title 'Usuário'				\
	--inputbox 'Digite o nome do seu usuário: '	\
	0 0)
#################read -s -p "Digite a sua senha: " SENHA
SENHA=$(dialog 					\
	--stdout				\
	--title 'Senha'				\
	--passwordbox 'Digite sua senha: '	\
	0 0)


[ $USER == $USUARIO ] && [ $PASS == $SENHA ] && MENU || SAIR
