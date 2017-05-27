#!/bin/bash
GU(){
################################FUNÇÕES SECUNDÁRIAS#############################
CONFIRM(){
TEMP=$?
if (( $TEMP == 0 )); then
 	dialog --stdout --infobox 'Realizado com sucesso' 0 0; sleep 1.5
elif (( $TEMP == 1 )); then
 	dialog --stdout --infobox 'Processo não finalizado tente novamente' 0 0; sleep 2.5
fi
}
VERIFY(){
if [ -z $1 ]; then
	dialog --stdout --msgbox "Impossivél identificar, campo em branco" 0 0; sleep 1.5
	break
fi
}
ALTERU(){
if [ $TMP == 0 ]; then
dialog --stdout --title 'Alterações realizadas' --editbox /etc/passwd 0 0; sleep1.5
fi
}
################################FUNÇÕES PRIMARIAS###############################
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
			ALTERU 
	if [ $PASS == $CONF_P ]; then
		useradd -m -d /home/$USER -r -s /bin/bash $USER
		(echo $PASS ; echo $PASS) | passwd $USER
			CONFIRM; sleep 2.5
			VZS=$?
	else
		dialog --stdout --ok-label vai --infobox "Senha incopativél" 0 0
			VZS=1
	fi


elif (( $OP == "2")); then
	APAGAR=$( dialog 	--stdout			    \
				--title 'Nome do usuário'	    \
				--inputbox 'Insira o nome do pivet' \
				0 0)
		VERIFY $APAGAR
userdel -r $APAGAR
	CONFIRM

	VZS=$?
fi
VZS=$?
done

ALTERU

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
while (($VZS != 0)); do 

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
		
		(echo $CONF_PN ; echo $CONF_PN) | passwd $PESQUISA
		CONFIRM
	else
		dialog --stdout --msgbox "Senha inconpativél" 0 0
	
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
	fi
	
VZS=$? 
done 

INICIAR

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
	6 'Sair')

case $OP in
	1)CAU ;;
	2)CAG ;;
	3)MODU ;;
	4)MODG ;;
	5)MODP ;;
	#6)SAIR ;;
	#*)echo 'Opção incorreta';;
esac

}
##################################PROGRAMA####################################

INICIAR
}
##############################################################################
GA(){
clear
######################### Função secundaria ###########################
VERIFY(){
if [  -z  $1  ]; then
	  dialog --stdout --msgbox "Impossivél indentificar, campo em branco"0 0; sleep 2.5
	break
fi
}

VIADAGEM(){
VIADO=$(ls)
dialog --stdout --msgbox "$VIADO" 0 0
}
#######################################################################
CONFIRM(){
TMP=$?
if (( $TMP == "0" )); then
	dialog --stdout --infobox "Realizado com sucesso" 0 0; sleep 1.5
elif (( $TMP == "1"  )); then
	dialog --stdout --infobox "Processo não realizado tente novamente" 0 0 3; sleep 1.5
fi
}

######################### FUNÇÃO ######################################
CRIARQ(){
VZS=1
while (( $VZS != "0" )); do
	QNT=$(dialog 	--stdout				\
	--title 'Criar'						\
	--menu 'Deseja criar Arquivo ou Diretorio?'		\
	0 0 0							\
	1 'Criar arquivo'					\
	2 'Criar diretorio'					\
	3 'Voltar' )
if [ $QNT == "1" ]; then
VIADAGEM
ARQUIVO=$(dialog	--stdout				     \
--title 'Criação de arquivo'					     \
--inputbox 'Digite o nome e a extenção que deseja para seu arquivo:' \
0 0)
		> $ARQUIVO
	CONFIRM
elif [ $QNT == "2" ]; then
VIADAGEM
DIRETORIO=$( dialog	--stdout				\
--title 'Criação de Diretorio'					\
--inputbox 'Digite o nome do Diretorio desejado ?'		\
0 0)
		mkdir $DIRETORIO
	CONFIRM
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
        1 'Mover'                                               \
        2 'Renomear'                                            \
        3 'Voltar')
if [ $OPIS == "1" ]; then
VIADAGEM
	ARQ=$( dialog   --stdout					\
			--title	'Nome do arquivo que deseja copiar'	\
			--inputbox 'insira o nome do arquivo'		\
			0 0)

	SELEC=$( dialog   --stdout					\
			--title	'Nome do diretorio onde deseja copiar'	\
			--inputbox 'Insira o nome do diretorio'		\
			0 0)

		cp $ARQ $SELECIONAR
		CONFIRM
elif [ $OPIS == "2" ]; then
VIADAGEM
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
VIADAGEM
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
VIADAGEM
	ARQD=$( dialog --stdout                                 \
                --title 'Nome do arquivo ou diretório'          \
                --inputbox 'Insira o nome do arquivo'           \
                0 0)
	NARQD=$( dialog --stdout             		                      \
                --title 'Novo nome do arquivo ou diretório'	              \
                --inputbox 'Insira o novo nome do arquivo ou diretorio'       \
                0 0)

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
		3 'Voltar')

if [ $ARQ == "1" ]; then
VIADAGEM
	APARQ=$( dialog --stdout 				\
	--title 'Apagar Arquivo'				\
	--inputbox 'Qual o nome do arquivo que deseja apagar :'	\
	0 0)
	rm  $APARQ
	CONFIRM

 elif [ $ARQ == "2" ]; then
VIADAGEM
   	APDIR=$( dialog --stdout					\
    	--title 'Apagar Diretorio'					\
    	--inputbox 'Qual o nome do diretorio que deseja apagar :'	\
    	0 0)
	rm -rf $APDIR
	CONFIRM
else
	break
fi
done
LOBY
}

# BKARQ(){
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
 #6) echo; exit 0 ;; 
esac
}
#####################################Programa################################################
LOBY
}
GRD(){
echo "OI"
}
#############################################################################################
GR(){
ATPCT(){
AT=$( dialog --stdout	--yes-label Sim	--no-label Não	\
	--title 'Atualização de pacotes'			\
	--yesno ' Deseja realmente atualizar todos os pacotes ?'\
	0 0) 
AT=$?
if [ $AT = 0 ]; then 
	apt-get update #> TRASH 
fi

}

INPCT(){
PA=$( dialog --stdout						\
	--title 'Instalação de pacotes'				\
	--inputbox 'Qual o nome do pacote que deseja instalar? '\
	0 0)
	apt-get install $PA #> TRASH
}

DNPCT(){
RE=$( dialog --stdout						\
	--title 'Remoção de pacotes'				\
	--inputbox 'Qual o nome do pacote que deseja remover? '	\
	0 0)
	apt-get autoremove $RE --purge #> TRASH
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
	#4)
esac
}
####################################################################################################################################
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
		5 'Gerenciamento de Dispositivo')
case $MENU in 
	1) GU ;;
	2) GA ;;
	3) GRD ;;
	4) GR ;;
	5) GD ;;
esac
}
##################################################################################################################################
RAIZ
