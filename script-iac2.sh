#!/bin/bash
#
# Autor: Dorival Barros Trindade Filho (dorivalbarrosti@gmail.com)
# Orientador: Denilson Bonatti
# Descrição: Preparação da VM(Virtual Box) para instalar o APACHE e aplicações (FEV-2023) .
# Versão: 1.0
# Licença: GPL#
#
# *** LIMPAR A TELA ****

clear
echo "$(tput setaf 6)"
echo "Comando CLEAR aplicado ..."
echo
echo "Bash Script em execução: " $(basename "$0")
echo "$(tput sgr 0)"
echo
sleep 0.5 #pausa proposital

# Situação temporal

# Ajuste para o fuso -3
timedatectl set-timezone America/Sao_Paulo

echo
echo "Dia : $(date +%x)"
echo "Hora: $(date +%T)"
echo

sleep 0.5 #pausa proposital

# Situação autoral
echo "Usuário autorizado: ${USER} !"
echo
sleep 0.5 #pausa proposital
echo 


# OBSERVAÇÃO: dentro de um script é reomendável usar o APT-GET



# FASE [ 01 ] .... ATUALIZANDO O SERVIDOR ....


echo "$(tput setaf 6)"
echo
echo "Bash Script em execução: " $(basename "$0")
echo "$(tput sgr 0)"
echo
sleep 1 #pausa proposital


echo "$(tput setaf 6)"
echo
echo " -> Atualizando o servidor... "
echo "$(tput sgr 0)"
echo
sleep 1 #pausa proposital


apt-get	update               # lista de elegíveis

apt-get	upgrade	-y           # realizando upgrade dos elegíveis
echo " Servidor atualizado ...ok!"
echo
sleep 0.5 #pausa proposital

# .... INSTALANDO APACHE E UNZIP ....

apt-get	install	apache2 -y   # instalando o APACHE
echo " Apache instalado ...ok!"
echo
sleep 0.5 #pausa proposital


apt-get	install	unzip -y     # instalando o UNZIP
echo " Unzip instalado ...ok!"
echo
sleep 0.5 #pausa proposital

# Estes dois últimos comandos poderiam ser construindos em uma única linha:
# apt-get instal apache2 unzip -y




# FASE [ 02 ] .... BAIXANDO A APLICAÇÃO PARA A VM ....

echo "$(tput setaf 6)"
echo
echo " -> Baixando e copiando os arquivos da aplicação... "
echo "$(tput sgr 0)"
echo
sleep 1 #pausa proposital



cd /tmp                      # alternando para o diretório TMP


wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
                             # download do arquivo compactado da aplicação pedida
echo " Download da aplicação concluído ...ok!"
echo
sleep 0.5 #pausa proposital


unzip main.zip               # o subdiretório 'linux-site-dio-main' será criado na descompactação
echo " Aplicação descompactada ...ok!"
echo
sleep 0.5 #pausa proposital


cd linux-site-dio-main            # alternando para o diterório...

cp -R * /var/www/html/       # copíando os arquivos da aplicação web para o servidor apache
echo " Aplicação transferida para o servidor Apache ...ok!"
sleep 0.5 #pausa proposital


# Fase [ 03 ] .... ENCERRAMENTO ....

echo
echo "$(tput setaf 6)Bash Script encerrado: " $(basename "$0") " ...ok!"
echo "Dia : $(date +%x)"
echo "Hora: $(date +%T)"
echo "$(tput sgr 0)"
sleep 1 #pausa proposital
echo 
