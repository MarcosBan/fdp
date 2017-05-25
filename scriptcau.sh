#!/bin/bash
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
#EM FASE DE TESTES PARA REDUZIR ERROS
#MAIS OPÇÕES ESTÃO POR VIR
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
#EM FASE DE TESTES PARA REDUZIR ERROS
#MAIS OPÇÕES ESTÃO POR VIR

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
#EM FASE DE TESTES PARA REDUZIR ERROS
#MAIS OPÇÕES ESTÃO POR VIR

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
#EM FASE DE TESTES PARA REDUZIR ERROS
#MAIS OPÇÕES ESTÃO POR VIR

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
        1 'Permissão'		                     \
        2 'Mudar dono da pasta'                      \
        3 'Voltar')
	
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

	fi
VZS=$? 
done 
#EM FASE DE TESTES PARA REDUZIR ERROS
#MAIS OPÇÕES ESTÃO POR VIR
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

