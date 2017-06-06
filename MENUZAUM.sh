#!/bin/bash
##############################################################################
#				   Omega				     #
#Gabi Ribeiro, Thiago Leal, Tiago Francisco, Natan Ferreira e Marcos Silva   #
#Em caso de alteração notifique um participante da equipe omega.             #
#Nome do programa Omega 0.5						     #
#									     #
#Ùltima atualização 31/05/2017						     # 
###############################FUNÇÕES SECUNDÁRIAS############################
VERIFY(){
if [ -z $1 ]; then
	dialog --stdout --msgbox "Impossivél identificar, campo em branco" 0 0; sleep 1.5
	break
fi
}
CONFIRM(){
TMP=$?
if (( $TMP == "0" )); then
	dialog --stdout --infobox "Realizado com sucesso" 0 0; sleep 1.5
elif (( $TMP == "1"  )); then
	dialog --stdout --infobox "Processo não realizado tente novamente" 0 0 3; sleep 1.5
fi
}

###############################FUNÇÕES PRIMARIAS############################
#-------------------------Gerenciamento de usuários-----------------------#
GU(){

CAU(){
	VZS=1
while (($VZS != 0)); do 
OP=$( dialog	--stdout			\
		--title 'Usuário '		\
		--menu 'Escolha uma opção'	\
	0 0 0					\
	1 'Criar  usuário'	 		\
	2 'Apagar usuário' 			\
	3 'Voltar')
if (( $OP == "1")); then
	USER=$( dialog 	--stdout				\
				--title 'Nome do usuário'		\
				--inputbox 'Insira o nome do usuário'	\
				0 0)
			VERIFY $USER 
	PASS=$( dialog 		--stdout				\
				--title 'Senha do usuário' 		\
				--inputbox 'Insira a senha' 		\
				0 0)
			VERIFY $PASS  
	CONF_P=$( dialog          --stdout           			\
                                  --title 'Confirmação'			\
                                  --passwordbox 'Insira a senha novamente'   \
                                  0 0)
			VERIFY $CONF_P
			 
	if [ $PASS == $CONF_P ]; then
		useradd -m -d /home/$USER -r -s /bin/bash $USER
		(echo $PASS ; echo $PASS) | passwd $USER
			CONFIRM; sleep 2.5
			VZS=$?
	else
		dialog --stdout --infobox "Senha incopativél" 0 0
			VZS=1
	fi


elif (( $OP == "2")); then
	APAGAR=$( dialog 	--stdout			      \
				--title 'Nome do usuário'	      \
				--inputbox 'Insira o nome do usuário' \
				0 0)
		VERIFY $APAGAR
userdel -r $APAGAR
	CONFIRM

	VZS=$?
fi
VZS=$?
done

INICIAR
}



#----------------------------------------------------------------------------#
CAG(){
	VZS=1
while (($VZS != 0)); do 
OP=$( dialog	--stdout			\
		--title 'Grupos'		\
		--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Criar  Grupo' 		\
	2 'Apagar Grupo' 		\
	3 'Voltar')
if (( $OP == "1")); then
	CRIAR=$( dialog 	--stdout				\
				--title 'Nome do usuário' 		\
				--inputbox 'Insira o nome do grupo'	\
				0 0)
	VERIFY $CRIAR
groupadd $CRIAR
	CONFIRM

elif (( $OP == "2")); then
	APAGAR=$( dialog 	--stdout				\
				--title 'Nome do grupo' 		\
				--inputbox 'Insira o nome do grupo' 	\
				0 0)
	VERIFY $APAGAR
delgroup $APAGAR
	CONFIRM
fi
	VZS=$?
done
INICIAR
}

#----------------------------------------------------------------------------#
MODU(){
	VZS=1
while (( $VZS != 0 )); do
	PESQUISA=$( dialog 	--stdout				\
				--title 'Pesquisa' 			\
				--inputbox 'Insira o nome do usuário' 	\
				0 0)
	VERIFY $PESQUISA
RESUL=$(grep $PESQUISA /etc/passwd)

 dialog --stdout --yes-label Confirma --no-label Voltar			\
	--title 'Confirme' 						\
	--yesno "$RESUL. Este é o usuário que você deseja altera?" 	\
7 60

CONF=$?
	if [ $CONF == "0" ]; then
	NPASS=$( dialog 	--stdout				\
			--title 'Nova senha' 				\
			--inputbox 'Insira a nova senha do usuário' 	\
			0 0)
	VERIFY $NPASS
	CONF_PN=$( dialog 	--stdout				\
				--title 'Confirmação' 			\
				--passwordbox 'Confirme a senha do usuário' \
				0 0)
	VERIFY $CONF_PN
		(echo $CONF_PN ; echo $CONF_PN) | passwd $PESQUISA
		CONFIRM
	elif [ $CONF == "1" ]; then
		dialog --stdout --msgbox "Senha inconpativél" 0 0
		break
	fi
done

INICIAR

}

#----------------------------------------------------------------------------#
MODG(){

	VZS=1
while (($VZS != 0)); do 

		OPI=$( dialog    --stdout                       	\
                --title 'Opções para usuário'				\
                --menu 'Escolha uma opção'      			\
        	0 0 0                           			\
        	1 'Adcionar usuario a um grupo'				\
        	2 'Remover usuario de um grupo'				\
        	3 'Voltar')

if [ $OPI == 1 ]; then
	USER=$( dialog  --stdout                                 		\
                         --title 'Adcionar ao grupo'                  		\
                          --inputbox 'Insira o nome do usuário' 		\
                          0 0)
	VERIFY $USER
	GROUP=$( dialog  --stdout                                 		\
                         --title 'Adcionar ao grupo'                   	 	\
                         --inputbox 'Insira o nome do grupo'   			\
                                0 0)
	VERIFY $GROUP
gpasswd -a $USER $GROUP
	CONFIRM

elif [ $OPI == 2 ]; then
 
	USER=$( dialog  --stdout                                       \
                        --title 'Adcionar ao grupo'                    \
                        --inputbox 'Insira o nome do usuário'          \
                        0 0)
        VERIFY $USER
	GROUP=$( dialog  --stdout                                       \
                         --title 'Adcionar ao grupo'                    \
                         --inputbox 'Insira o nome do grupo'   		\
                         0 0)
	VERIFY $GROUP
gpasswd -d $USER $GROUP
	CONFIRM

fi
	VZS=$?
done

INICIAR
}
#----------------------------------------------------------------------------#
MODP(){
	VZS=1
while (($VZS != 0)); do 
OPI=$( dialog    --stdout                        \
                 --title 'Opções para usuário'   \
                 --menu 'Escolha uma opção'      \
         0 0 0                                   \
        1 'Permissão'		    		                     \
        2 'Mudar dono e grupo da pasta'         	             \
        3 'Mudar dono da pasta'						\
	4 'Mudar grupo da pasta'					\
	5 'Voltar')
	
	if [ $OPI == 1 ]; then
		MEN=$( dialog --stdout									 \
		     	     --title 'Tipo de permissão' 					   	 \
			     --checklist 'Selecione o que o dono, grupo e outros pode realizar na pasta' \
			     0 0 0								  	 \
		777	'Todos tem acesso livre a pasta ou podem executar o arquivo' 	off	\
		770	'Apenas o dono e grupo da pasta tem acesso'		 	off	\
		775	'Dono e grupo tem acesso e outros podem ler e executar'		off	\
		750	'Apenas o dono pode fazer tudo na pasta, o grupo tem acesso'	off	\
		700	'Apenas dono acessa a pasta ou executa arquivo' 		off	)
		
		PASTA=$( dialog --stdout 			\
			--title "Nome do diretório"		\
			--inputbox "Insira o nome do diretorio"	\
			0 0)
		VERIFY $PASTA
		chmod $MEN $PASTA
		CONFIRM
	
		if [$TEMP = 1]; then
		dialog --stdout --infobox "Foi aplicada a permissão $MEN no diretorio $PASTA" 0 0; sleep 1.5
		fi
	elif [ $OPI == 2 ]; then
		DONO=$( dialog --stdout                        		    \
                        --title "Nome do dono"             		    \
                        --inputbox "Insira o nome do usuário dono da pasta" \
                        0 0)
		GRUPO=$(dialog --stdout                        			    \
                        --title "Nome do grupo"             			    \
                        --inputbox "Insira o nome grupo que poderá acessar a pasta" \
                        0 0)
		WAY=$(dialog --stdout                        		   \
                        --title "Nome do diretório"             	   \
                        --inputbox "Insira o nome ou caminho do diretorio" \
                        0 0)
	VERIFY $DONO; VERIFY $GRUPO; VERIFY $WAY
	chown $DONO:$GRUPO $WAY
	CONFIRM
	
	elif [ $OPI == 3 ]; then
	DONO=$( dialog --stdout                        		    \
                --title "Nome do dono"             		    \
                --inputbox "Insira o nome do usuário dono da pasta" \
                0 0)
	VERIFY $DONO
	WAY=$(dialog --stdout                        		   \
                     --title "Nome do diretório" 	            	   \
                     --inputbox "Insira o nome ou caminho do diretorio"   \
                     0 0)
	VERIFY $WAY
	chown $DONO $WAY
	CONFIRM
	elif [ $OPI == 4 ]; then
		GRUPO=$(dialog --stdout                        			    \
                        --title "Nome do grupo"             			    \
                        --inputbox "Insira o nome grupo que poderá acessar a pasta" \
                        0 0)
		VERIFY $GRUPO
		WAY=$(dialog --stdout                        		   \
                        --title "Nome do diretório"             	   \
                        --inputbox "Insira o nome ou caminho do diretorio" \
			  0 0)
		VERIFY $WAY
		chgrp $GRUPO $WAY  
		CONFIRM
		
	fi
VZS=$?

done 

INICIAR

}

VLISU(){
dialog --title "Lista de usuários" --textbox /etc/passwd 0 0 
}

VLISG(){
dialog --title "Lista de grupos" --textbox /etc/group 0 0
}
#----------------------------------------------------------------------------#

INICIAR(){

OP=$( dialog	--stdout			\
		--title 'Opções para usuário'	\
		--menu 'Escolha uma opção'	\
	0 0 0					\
	1 'Criar ou apagar usuario' 			\
	2 'Criar ou apagar grupos'			\
	3 'Modificar senha de  usuarios'		\
	4 'Modificar grupos'				\
	5 'Modificar permissões'			\
	6 'Verificar lista de usuários'			\
	7 'Verificar lista de grupos'			\
	8 'Voltar')

case $OP in
	1)CAU ;;
	2)CAG ;;
	3)MODU ;;
	4)MODG ;;
	5)MODP ;;
	6)VLISU ; INICIAR ;;
	7)VLISG ; INICIAR ;;
	8)RAIZ ;;
esac

}
##################################PROGRAMA####################################

INICIAR
}
##############################################################################
GA(){
clear
VDIR(){
 dialog 	 --yes-label Atual --no-label EspecÍfico		\
		--title 'Verificação'	 				\
		--yesno 'Verificar diretorio'	 			\
		0 0
OP=$?
	if [ $OP == 0 ]; then
		VERDIR=$(ls)
dialog --stdout --title "Arquivos do diretorio atual." --msgbox "$VERDIR" 0 0
	elif [ $OP == 1 ]; then
		PESQUISA=$( dialog --stdout 				\
				--title 'Diretorio especifico' 		\
				--inputbox 'Digite o nome do diretorio' \
				0 0)
	 	 PVERDIR=$(ls $PESQUISA)
		dialog --stdout	--title "Arquivos do diretorio $PESQUISA." --msgbox "$PVERDIR" 0 0
	fi
}



######################### FUNÇÃO ######################################
CRIARQ(){
VZS=1
while (( $VZS != "0" )); do
	OPIS=$( dialog 	--stdout				\
	--title 'Criar'						\
	--menu 'Deseja criar Arquivo ou Diretorio?'		\
	0 0 0							\
	1 'Criar arquivo'					\
	2 'Criar diretorio'					\
	3 'Verificar diretorio'					\
	4 'Voltar' )
if [ $OPIS == "1" ]; then
ARQUIVO=$(dialog	--stdout				     \
--title 'Criação de arquivo'					     \
--inputbox 'Digite o nome e a extenção que deseja para seu arquivo:' \
0 0)
		> $ARQUIVO
	CONFIRM
elif [ $OPIS == "2" ]; then
	#VDIR
DIRETORIO=$( dialog	--stdout				\
--title 'Criação de Diretorio'					\
--inputbox 'Digite o nome do Diretorio desejado ?'		\
0 0)
		mkdir $DIRETORIO
	CONFIRM

elif [ $OPIS == "3" ]; then
	VDIR
else
	break
fi
done
LOBY

}
#-----------------------------------------------------------------------
COARQ(){
VZS=1
while (( $VZS != "0" )); do
OPIS=$( dialog 	--stdout                                 	\
        --title 'Tipo'                            		\
        --menu 'Deseja copiar Arquivo ou Diretorio? '           \
        0 0 0                                                   \
        1 'Arquivo'                                             \
        2 'Diretorio'                                           \
        3 'Voltar')
if [ $OPIS == "1" ]; then
VDIR
	ARQ=$( dialog   --stdout					\
			--title	'Nome do arquivo que deseja copiar'	\
			--inputbox 'insira o nome do arquivo'		\
			0 0)
	VERIFY $ARQ
	SELEC=$( dialog --stdout					\
			--title	'Nome do diretorio onde deseja copiar'	\
			--inputbox 'Insira o nome do diretorio'		\
			0 0)
	VERIFY $SELEC
		cp $ARQ $SELEC
		CONFIRM
elif [ $OPIS == "2" ]; then
	VDIR
	DIR=$( dialog   --stdout                                        \
                        --title 'Nome do arquivo que deseja copiar'     \
                        --inputbox 'insira o nome do arquivo'           \
                        0 0)

        SELEC=$( dialog   --stdout                                 	\
                        --title 'Nome do diretorio onde deseja copiar'  \
                        --inputbox 'Insira o nome do diretorio'         \
                        0 0)
		cp -r $DIR $SELEC
		CONFIRM
else
	break
fi
done

LOBY
}
#----------------------------------------------------------------------#
MRARQ(){
	VZS=1
while (( $VZS != "0" )); do
	BABY=$( dialog --stdout					\
	--title 'Mover ou Renomear '				\
	--menu 'Deseja Mover ou Renomear ? '			\
	0 0 0							\
	1 'Mover'						\
	2 'Renomear'						\
	3 'Voltar')

if [ $BABY == "1" ]; then
VDIR
	ARQD=$( dialog --stdout					\
		--title 'Nome do arquivo ou diretório'		\
		--inputbox 'Insira o nome do arquivo'		\
		0 0)
	CAMI=$( dialog --stdout 						\
		--title 'Diretorio'						\
		--inputbox 'Insira o nome do diretorio ou o caminho até ele.'	\
		0 0)
	mv $ARQD $CAMI
	CONFIRM
elif [ $BABY == "2" ]; then
VDIR
	ARQD=$( dialog --stdout                                 \
                --title 'Nome do arquivo ou diretório'          \
                --inputbox 'Insira o nome do arquivo'           \
                0 0)
	VERIFY $ARQD
	NARQD=$( dialog --stdout             		                      \
                --title 'Novo nome do arquivo ou diretório'	              \
                --inputbox 'Insira o novo nome do arquivo ou diretorio'       \
                0 0)
	VERIFY $NARQD
	mv $ARQD $NARQD
	CONFIRM
else
	break

fi
done

LOBY
}
#----------------------------------------------------------------------#
APARQ(){
	VZS=1
while (( $VZS != "0" )); do
ARQ=$( dialog   --stdout					\
		--title	'Apagar '				\
		--menu 'Apagar Arquivo ou Diretorio?'		\
		0 0 0						\
		1 'Arquivo'					\
		2 'Diretorio'					\
		3 'Verificar diretorio'				\
		4 'Voltar')

	if [ $ARQ == "1" ]; then

	APARQ=$( dialog --stdout 				\
	--title 'Apagar Arquivo'				\
	--inputbox 'Qual o nome do arquivo que deseja apagar :'	\
	0 0)
	rm  $APARQ
	CONFIRM

 	elif [ $ARQ == "2" ]; then

   	APDIR=$( dialog --stdout					\
    	--title 'Apagar Diretorio'					\
    	--inputbox 'Qual o nome do diretorio que deseja apagar :'	\
    	0 0)
	rm -rf $APDIR
	CONFIRM
 	elif [ $ARQ == "3" ]; then
	VDIR
	else
	break
	fi
done
	LOBY
}
BKARQ(){
CENTRAL=$(dialog --stdout 					\
		--title "Backup de arquivos e diretórios."	\
		--menu "Escolha uma opção."			\
		0 0 0						\
		1 'Comprimir arquivo ou diretorio'		\
		2 'Extrair arquivo ou diretorio'		\
		3 'Verificar arquivo comprimido.'		\
		4 'Voltar')
if [ $CENTRAL == "1" ]; then
NOME=$( dialog --stdout 					\
	--title "Comprimir"					\
	--inputbox "Digite o nome do arquivo ou diretorio" 	\
	0 0)
	VERIFY $NOME
tar -zcf $NOME.tar $NOME
	CONFIRM
 dialog 	 --yes-label Atual --no-label EspecÍfico		\
		--title 'Local para o arquivo comprimido'		\
		--yesno 'Selecione um local para o arquivo'	 	\
		0 0
OP=$?
	if [ $OP == 0 ]; then
		VERDIR=(ls)
dialog --title "Arquivos do diretorio atual." --msgbox "$VERDIR" 0 0
	elif [ $OP == 1 ]; then
		DESTIN=$( dialog --stdout 				\
				--title 'Especifico' 			\
				--inputbox 'Digite o nome do diretorio' \
				0 0)
	 	 mv $NOME.tar $DESTIN
	fi
	
elif [ $CENTRAL == "2" ]; then

 dialog 	 --yes-label Atual --no-label EspecÍfico		\
		--title 'Local para o arquivo comprimido'		\
		--yesno 'Selecione um local para o arquivo'	 	\
		0 0
OP=$?
	if [ $OP == 0 ]; then
	NOME=$( dialog --stdout 					\
	--title "Extrair"					\
	--inputbox "Digite o nome do arquivo ou diretorio" 	\
	0 0)
	VERIFY $NOME
		tar -xzf $NOME.tar $NOME
	CONFIRM
	elif [ $OP == 1 ]; then
	NOME=$( dialog --stdout 					\
	--title "Extrair"					\
	--inputbox "Digite o nome do arquivo ou diretorio" 	\
	0 0)
	VERIFY $NOME
		tar -xzf $NOME.tar $NOME
		DESTIN=$( dialog --stdout 				\
				--title 'Especifico' 			\
				--inputbox 'Digite o nome do diretorio' \
				0 0)
	 	 mv $NOME.tar $DESTIN
	fi

NOME=$( dialog --stdout 					\
	--title "Extrair"					\
	--inputbox "Digite o nome do arquivo ou diretorio" 	\
	0 0)
	VERIFY $NOME
tar -xzf $NOME.tar $NOME
	CONFIRM
	
elif [ $CENTRAL == "3" ]; then
  dialog 	 --yes-label Atual --no-label EspecÍfico		\
		--title 'Local para o arquivo comprimido'	 				\
		--yesno 'Selecione um local para o arquivo'	 			\
		0 0

elif [ $CENTRAL == "4" ]; then
	 RAIZ
fi
}
LOBY(){
PWD=$(pwd)
MENU=$(dialog --stdout                          	\
	--title "Gerenciamento de Arquivo em $PWD"	\
	--menu   'Escolha uma opçao'			\
	0 0 0						\
 1 'Criar arquivos e diretorios'			\
 2 'Copiar arquivos e diretorios'			\
 3 'Mover ou renomear arquivos e diretorios'		\
 4 'Apagar arquivos e diretorios'			\
 5 'Verificar diretorios'				\
 6 'Backup de arquivos e diretorios'			\
 7 'Voltar')						

case $MENU in

  1) CRIARQ ;;
  2) COARQ ;;
  3) MRARQ ;;
  4) APARQ ;;
  5) VDIR ; LOBY ;;
  6) BKARQ ;;
  7) RAIZ ;; 

esac
}
################################Programa#################################
LOBY
}
GRD(){
clear
function CONFIP(){
MENU=$( dialog --stdout	--ok-label Continuar --cancel-label Cancelar	\
	--title 'Configurar IP'						\
	--inputbox 'Digite o nome da interface que deseja configurar :'	\
	0 0)
DIG=$?
if [ $DIG == 0 ]; then 
IP=$( dialog --stdout --ok-label Continuar --cancel-label Cancelar	\
--title 'Configurar IP'							\
--inputbox 'Digite o IP/MÁSCARA  que deseja inserir : '			\
0 0)
	ip addr add $IP dev $MENU
 	elif [ $DIG == 1 ]; then 
	ip addr flush dev $MENU 
	dhclient $MENU
	QNT
fi
}
#-------------------------------------------------------------------------#
function REMIP(){
REM=$( dialog --stdout	 					\
--title 'Remover IP'						\
--inputbox 'Qual o nome da interface que deseja remover:'	\
0 0)
MOV=$( dialog --stdout						\
--title 'Remover IP'						\
--inputbox 'Qual o IP que deseja remover: '			\
0 0)

DIG=$?
if [ $DIG == 0 ]; then
	ip addr del $MOV dev $REM
	QNT
fi
}
#---------------------------------------------------------------------#
function ADP(){
AT=$( dialog --stdout --ok-label Continuar --cancel-label Cancelar	\
	--title 'Ativando ou desativando a placa'			\
	--menu 'Escolha a opção desejada: '				\
	0 0 0								\
	AT 'Ativar a interface'						\
	DE 'Desativar interface'					\
	VO 'Voltar')
if [ $AT == 'AT' ]; then
INTERFACE=$( dialog --stdout --ok-label Continuar --cancel-label Cancelar\
	--title 'Ativando a interface'					\
	--inputbox 'Qual interface deseja ativar:'			\
	0 0)
ip link set $INTERFACE up
CONFIRM
		elif [ $AT == 'DE' ]; then
	INTERFACE=$( dialog --stdout --ok-label Continuar --cancel-label Cancelar\
	--title 'Desativando a interface'					\
	--inputbox 'Qual interface deseja desativar:'			\
	0 0)
ip link set $INTERFACE down
CONFIRM
		elif [ $AT == 'VO' ]; then
		QNT
fi
}
#------------------------------------------------------------------#
function CONFDHCP(){
DHCP=$( dialog --stdout --ok-label Continuar  --cancel-label Cancelar\
	--title 'Configurar interface em dhcp'				\
	--inputbox 'Digite a interface desejada:'			\
	0 0)
DIG=$?
if [ $DIG == 0]; then 
	ip addr flush dev $DHCP
	dhclient $DHCP
	CONFIRM
	else
	QNT
fi
}
##########################MENU##################################
function QNT(){
REDE=$( dialog --stdout					\
	--title 'Gerenciamento de Redes'		\
	--menu 'Escolha a opção desejada: '		\
	0 0 0						\
	1 'Configurar IP expecificando a mascara'	\
	2 'Remover IP'					\
	3 'Ativando ou desativando a placa'		\
	4 'Configurar interface em dhcp'		\
	5 'Voltar')
case $REDE in 
	1) CONFIP ;;
	2) REMIP ;;
	3) ADP ;;
	4) CONFDHCP ;; 
	5) RAIZ ;;
esac
}
QNT
}
###############################################################################
GR(){
ATPCT(){
 dialog --stdout	--yes-label Sim	--no-label Não		\
	--title 'Atualização de pacotes'			\
	--yesno ' Deseja realmente atualizar todos os pacotes ?'\
	0 0
AT=$?
 
if [ $AT = 0 ]; then 
	apt-get update
	CONFIRM
fi

MENUS

}

INPCT(){

PA=$( dialog --stdout						\
	--title 'Instalação de pacotes'				\
	--inputbox 'Qual o nome do pacote que deseja instalar? '\
	0 0)
	apt-get install $PA 
	CONFIRM

	MENUS

VERIFY $PA
}
DNPCT(){
RE=$( dialog --stdout						\
	--title 'Remoção de pacotes'				\
	--inputbox 'Qual o nome do pacote que deseja remover? '	\
	0 0)
	apt-get autoremove $RE --purge 
	CONFIRM

	MENUS

VERIFY $RE
}
MENUS(){
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
	4) RAIZ ;;
esac
}
###############################################################################
MENUS
}

function RAIZ (){
clear
MENU=$( dialog --stdout						\
	--title 'Programa Omega '				\
	--menu 'Escolha o Gerenciamento que deseja fazer: '	\
	0 0 0							\
		1 'Gerenciamento de Usuário'			\
		2 'Gerenciamento de Arquivo'			\
		3 'Gerenciamento de Rede   '			\
		4 'Gerenciamento de Repositorio'		\
		5 'Sair')
case $MENU in 
	1) GU ;;
	2) GA ;;
	3) GRD ;;
	4) GR ;;
	5) exit 0 ;;
esac
}
########################################################################
RAIZ
