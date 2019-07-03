#!/bin/bash

# Descrição:
# Faz uma transferencia de arquivos, colocando esse arquivo em qualquer lugar da maquina remota.
#

# Criação: 13/04/2019
# Autor: Bruno Dias da Silva
# E-mail: bsilva@registro.br

# Licença: Pode ser distribuído e editado, conforme a necessidade.

# Ultima edição:
# Feita por: Bruno Dias
# Data: 13/04/2019

# env $1 $2 $3 $4 $5
# sendo
# env source destination user save ip
# save = Pasta para onde o arquivo sera movido.

transferir () {

EnvCommand="/usr/bin/env.sh"
Source="$1"
Destination="$2"
user="$3"
save="$4"
porta="$5"
arq="$(rev <<< "$(cut -d "/" -f1 <<< "$(rev <<< "$(echo $Source)")")")"

read -sp "Digite a senha do usuário: " senha

IP="200.160.3.87
200.160.3.117
200.160.3.118"

#200.160.3.113 - NU


for ip in $IP 
do
        xterm -e $EnvCommand $Source $Destination $user $save $ip $senha $porta $arq &

done

}


if [ $# -ne 4 ];then
        echo "Numero de argumento invalido"
        echo -e "\n\nsource=\$1 destination=\$2 user=\$3 save=\$4 porta=\$5\n"
	echo -e "Se voce não colocar a porta, será usada a porta 22\n\n"
        exit 1
fi

if [ -z $6 ];then
	porta="22"
	echo -e "\n\n Usando a porta 22!!!\n\n"
	transferir $1 $2 $3 $4 $porta
else
	transferir $1 $2 $3 $4 $5

fi
