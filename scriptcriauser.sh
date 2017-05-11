#!/bin/bash
OP=1
################################FUNÇÃO#####################################
CRIU(){
echo "Só de passagem mesmo."
echo "Pressione [ENTER] pra vazar"
read XXX
}

APAU(){
echo "Só de passagem mesmo."
echo "Pressione [ENTER] pra vazar"
read XXX
}

MODU(){
echo "Só de passagem mesmo."
echo "Pressione [ENTER] pra vazar"
read XXX
}

PERMU(){
echo "Só de passagem mesmo."
echo "Pressione [ENTER] pra vazar"
read XXX
}

CRIG(){
echo "Só de passagem mesmo."
echo "Pressione [ENTER] pra vazar"
read XXX
}

MODG(){
echo "Só de passagem mesmo."
echo "Pressione [ENTER] pra vazar"
read XXX
}

################################PROGRAMA###################################
while ((OP!=0)); do
	clear
	echo '1)Criar usuário'
	echo '2)Apagar usuário'
	echo '3)Modificar usuário'
	echo '4)Permissões do usuário'
	echo '5)Criar grupos'
	echo '6)Modificar grupos'
	echo '7)Sair'

read -p "Escolha uma opção" OP

case $OP in
	1)CRIU ;;
	2)APAU ;;
	3)MODU ;;
	4)PERMU ;;
	5)CRIG ;;
	6)MODG ;;
	7) ;;
	*)echo 'Opção incorreta' ;;
	
esac

done
