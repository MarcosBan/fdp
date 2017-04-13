#!/bin/bash 
clear

echo "Gerenciador Debian"

VAR=20 

while (($VAR != 0)); do
echo "Para encerrar um programa digite 0"
echo "O que deseja fazer?"


echo "[1] Copiar arquivos"
echo "[2] Excluir arquivos"
echo "[3] Mover arquivos"
echo "[4] Instalar programas"
echo "[5] Criar usuarios"
echo "[6] Deletar usuarios"
echo "[7] Criar grupos"
echo "[8] Adcionar usuarios aos grupos"
echo "[9] Excluir usuarios dos grupos "
echo "[10] Mudar dono de uma pasta"
echo "[11] Criar pasta"
echo "[12] Remover pasta"
echo "[13] Criar arquivos"

read VAR

if (($VAR == 1)); then

echo Qual arquivo deseja copiar?
read ARQ
echo Para qual diretorio?
read DIR

cp $ARQ $DIR
 
elif (($VAR == 2)); then
echo "Qual arquivo deseja excluir?"
read ARQ1

rm $ARQ1


elif (($VAR == 3)); then
echo "Qual o arquivo para mover?"
read ARQ3 
echo "Para qual destino?"
read DIR1
 
mv $ARQ3 $DIR1

elif (($VAR ==4)); then
echo "Qual programa deseja instalar?"
read PROG

apt-get install $PROG

elif (($VAR ==5)); then
echo "Nome do usuario"
read USER
echo "Qual a senha?"
read PASS

useradd -m -d /home/$USER -r -s /bin/bash $USER 
(echo $PASS ; echo $PASS) | passwd $USER

elif (($VAR ==6)); then
echo "Qual o usuário que você deseja excluir"
read DEL
userdel -r $DEL

elif (($VAR ==7)); then
echo "Qual o nome do grupo?"
read GROUP

addgroup $GROUP

elif (($VAR ==8)); then
echo "Qual o usuario?"
read USER
echo "Qual o grupo?"
read GROUP2

gpasswd -a $USER $GROUP2

elif (($VAR ==9)); then
echo "Qual o usuario?"
read USER
echo "Qual o grupo?"
read GROUP

gpasswd -d $USER $GROUP

elif (($VAR ==10)); then
echo "Digite um usuario existente"
read USER
echo "Digite um grupo"
read GROUP
echo "Digite o caminho para pasta de destino"
read WAY

chmod $USER:$GROUP $WAY

elif (($VAR ==11)); then
echo "Digite o nome do diretorio"
read DIR

mkdir $DIR

elif (($VAR ==12)); then
echo "Qual diretorio deseja remover?"
read $DIR

rm -rf $DIR

elif (($VAR ==13)); then 
echo "Digite um nome de arquivo"
read ARQ

touch $ARQ

fi 

done 
