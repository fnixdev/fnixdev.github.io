#!/bin/bash
# Instruções: https://raw.githubusercontent.com/fnixdev/KannaX
# Para executar o script de configuração, use:
#
# wget https://fnixdev.github.io/Setup_Local_VPS.sh
# chmod +x Setup_Local_VPS.sh
# ./Setup_Local_VPS.sh
#
# GitHub Repository: https://github.com/fnixdev/KannaX

echo "Script de instalação do KannaX by fnixdev"

if [ $(id -u) = 0 ]; then
   echo "Este script não deve ser executado como root ou sudo. Execute normalmente com ./Setup_Local_VPS.sh. Se você sabe o que está fazendo e deseja substituir esta edição, verifique Setup_Local_VPS.sh. Saindo..."
   exit 1
fi

# Instalando dependencias
echo "Instalando Dependencias.."
if [ ! -n "`which sudo`" ]; then
  apt-get update && apt-get install sudo -y
fi
sudo apt-get update -y
sudo apt-get install tree -y
sudo apt-get install wget2 -y
sudo apt-get install p7zip-full -y
sudo apt-get install jq -y
sudo apt-get install ffmpeg -y
sudo apt-get install wget -y
sudo apt-get install git -y
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm google-chrome-stable_current_amd64.deb
echo "Instalando Python3.9..."
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install python3.9 -y
sudo apt install neofetch -y

echo "Clonando Repositorio"
cd ~
sudo git clone https://github.com/fnixdev/KannaX.git
cd KannaX

echo "Instalando Requisitos do KannaX"
sudo pip install -r requirements.txt
sudo pip3 install -r requirements.txt
sudo cp config.env.sample config.env
echo "Configurando Screen ..."

sudo apt install screen -y

echo "Instalançao Concluida"
cd ~
cd KannaX

while true; do
    read -p "Deseja Gerar sua Session String? y/n :" yn
    case $yn in
        [Yy]* ) sudo bash genStr; break;;
        [Nn]* ) exit;;
        * ) echo "Por Favor responda Y ou N";;
    esac
done

while true; do
    read -p "Deseja configurar config.env agora? y/n :" yn
    case $yn in
        [Yy]* ) sudo nano config.env; break;;
        [Nn]* ) exit;;
        * ) echo "Por Favor responda Y ou N";;
    esac
done

while true; do
    read -p "Caso tenha gerado sua SessionString e configurado o arquivo config.env com as Vars necessarias digite Y para iniciar o bot agora ou N para nao iniciar y/n :" yn
    case $yn in
        [Yy]* ) sudo ./start.sh; break;;
        [Nn]* ) exit;;
        * ) echo "Por Favor responda Y ou N";;
    esac
done

echo "KANNABOT INSTALADO COM SUCESSO"
echo "CONFIGURE SUAS VARs PARA INICIAR O KannaX"
echo "PARA INICIAR O KannaX DIGITE ./start.sh"
echo "OBRIGADO POR ESCOLHER O KannaX"
