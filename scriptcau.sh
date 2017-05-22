#!/bin/bash
################################FUNÇÕES SECUNDÁRIAS#############################

#-------------------------------Modificar Grupos-------------------------------#
ADUG(){

}

RMUG(){

}

CRG(){
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
	CRIAR=$( dialog 	--stdout				\
				--title 'Nome do usuário'		\
				--inputbox 'Insira o nome do pivet'	\
				0 0)

	PASS=$( dialog 		--stdout				\
				--title 'Nome do usuário' 		\
				--inputbox 'INSIRA A SENHA' 		\
				0 0)

useradd -m -d /home/$CRIAR -r -s /bin/bash $CRIAR
(echo $PASS ; echo $PASS) | passwd $CRIAR



elif (( $OP == "2")); then
	APAGAR=$( dialog 	--stdout		\
				--title 'Nome do usuário' \
				--inputbox 'Insira o nome do pivet' \
				0 0)

userdel -r $APAGAR


if (($? == 0)); then

 dialog --stdout --infobox 'Realizado com sucesso' 0 0

elif (($? == 1)); then

 dialog --stdout --pause 'Processo não finalizado tente novamente' 100 50 3

fi

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

groupadd $CRIAR


elif (( $OP == "2")); then
	APAGAR=$( dialog 	--stdout				\
				--title 'Nome do grupo' 		\
				--inputbox 'Insira o nome do grupo' 	\
				0 0)

delgroup $APAGAR
fi

if (($? == 0)); then

 dialog --stdout --infobox 'Realizado com sucesso' 0 0

elif (($? == 1)); then

 dialog --stdout --pause 'Processo não finalizado tente novamente' 10 5 3

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

RESUL=$(grep $PESQUISA /etc/passwd)


dialog	--yes-label Confirma --no-label Voltar				\
	--title 'Confirme' 						\
	--yesno "$RESUL. Este é o usuário que você deseja altera?" 	\
7 60

CONF=$?
	if [$CONF == 0]; then
		
	PASS=$( dialog 	--stdout					\
				--title 'Pesquisa' 			\
				--inputbox 'Insira o nome do usuário' 	\
				0 0)

	CONF_P=$( dialog 	--stdout					\
				--title 'Confirmação' 				\
				--passwordbox 'Confirme a senha do usuário' 	\
				0 0)
		(echo $CONF_P ; echo $CONF_P) | passwd $PESQUISA
	else

		dialog --stdout --msgbox "Senha inconpativél" 0 0
		
	fi


if (($? == 0)); then

 dialog --stdout --infobox 'Realizado com sucesso' 0 0

elif (($? == 1)); then

 dialog --stdout --pause 'Processo não finalizado tente novamente' 10 5 3

fi

VZS=$?
done
INICIAR
}


#----------------------------------------------------------------------------#
MODG(){

VZS=1
while (($VZS != 0)); do 

		OPI=$( dialog    --stdout                        \
                --title 'Opções para usuário'   \
                --menu 'Escolha uma opção'      \
        0 0 0                           	\
        1 'Adcionar usuario a um grupo'			\
        2 'Remover usuario de um grupo'			\
        3 'Criar ou remover grupo'			\
        4 'Voltar)

case $OPI in
        1)ADUG ;;
        2)RMUG ;;
        3)CRG ;;
        #4)SAIR ;;
        *)echo 'Opção incorreta';;
esac
if (($? == 0)); then

 dialog --stdout --infobox 'Realizado com sucesso' 0 0

elif (($? == 1)); then

 dialog --stdout --pause 'Processo não finalizado tente novamente' 10 5 3

fi

VZS=$?
done

INICIAR
}
#----------------------------------------------------------------------------#
MODP(){



}



#----------------------------------------------------------------------------#

INICIAR(){

OP=$( dialog	--stdout			\
		--title 'Opções para usuário'	\
		--menu 'Escolha uma opção'	\
	0 0 0				\
	1 'Criar ou apagar usuario' 	\
	2 'Mudar senha do  usuário'	\
	3 'Criar ou apagar grupos'	\
	4 'Modificar usuarios'		\
	5 'Modificar grupos'		\
	6 'Modificar permissões'	\
	7 'Sair')

case $OP in
	1)CAU ;;
	2)MODU ;;
	3)CAG ;;
	4)MODG ;;
	5)MODP ;;
	#6)SAIR ;;
	*)echo 'Opção incorreta';;
esac

}
##################################PROGRAMA####################################

INICIAR


