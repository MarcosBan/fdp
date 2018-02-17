#!/bin/bash
echo "Bem vindo ao validador de informações!"

read -p  "Digite seu nome: " NAME
[[ $(echo $NAME | grep -E "^([[:alpha:]]|[[:space:]])+$") ]] && echo Valido || echo Invaido

read -p "Digite sua data de nascimento: " DATA
[[ $(echo $DATA | grep -E "^(3[01]|[12][0-9]|0[0-9]|[0-9])/(1[0-2]|0[1-9])/(19[0-9]{2}|20(0[0-9]|1[0-8]))$") ]] && echo Valido || echo Invalido

read -p "Digite seu CPF: " CPF
[[ $(echo $CPF | grep -E "^([0-9]{3})\.([0-9]{3})\.([0-9]{3})-([0-9]{2})$") ]] && echo Valido || echo Invalido

read -p "Digite seu RG: " RG
[[ $(echo $RG | grep -E "^([0-9]{2})\.([0-9]{3})\.([0-9]{3})-([0-9])$") ]] && echo Valido || echo Invalido

read -p "Digite seu telefone: " TEL
[[ $(echo $TEL | grep -E "^\(([0-9]{2})\)(9[0-9]{4}|[0-9]{4})-([0-9]{4})$") ]] && echo Valido || echo Invalido

read -p  "Digite seu e-mail: " MAIL
[[ $(echo $MAIL | grep -E "^([[:alnum:]])+\.([[:alnum:]])+@([a-z])+\.([a-z]{3})") ]] && echo Valido || echo Invalido
 
read -p "Digite seu IP: " IP
[[ $(echo $IP | grep -E "^([0-9]|[0-9]{2}|1[0-9]{2}|2[0-5]{2})\.\1\.\1\.\1") ]] && echo Valido || echo Invalido 

read -p "Digite seu IP: " IP
[[ $(echo $IP | grep -E "^([0-9]|[0-9]{2}|1[0-9]{2}|2[0-5]{2})\.\1\.\1\.\1") ]] && echo Valido || echo Invalido

read -p "Digite sua mascará de rede: " MASK
[[ $(echo $MASK | grep -E "^(255\.(0|128|192|224|240|248|252)\.\1\.\1") ]] && echo Valido || echo Invalido
