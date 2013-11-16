#!/bin/bash

# Script para desenvolvedores web no Ubuntu
# Criado por Willian Justen

# Esse script foi escrito usando o zenity e tem 
# o objetivo de agilizar a instalação de programas
# básicos no mundo do desenvolvimento web atual.
# É um script bem básico e rápido, sugestões são bem vindas =)

zenity --info --title "Script Web Development" --text "Este é um script simples para instalação de ferramentas úteis para Desenvolvimento Web e do ambiente do Ubuntu. \n\nCriado por: Willian Justen de Vasconcellos"

resposta=$(zenity  --list  --text "Escolha os pacotes que deseja instalar." --checklist  --column "Instalar" --column "Id" --column "Pacote" FALSE "1" "Restricted-Extras (Codecs de áudio e vídeo, plugin flash, java entre outros)" FALSE "2" "Gimp (Editor de Imagens)" FALSE "3" "Inkscape (Editor de Vetores)" FALSE "4" "Imagemagick (Editor de Imagens via Terminal)" FALSE "5" "Sublime Text 2" FALSE "6" "Sublime Text 3" FALSE "7" "Brackets" FALSE "8" "Dropbox" FALSE "9" "Mysql Workbench" FALSE "10" "Lamp+phpmyadmin" FALSE "11" "Google Chromium" FALSE "12" "Google Chrome" FALSE "13" "Git e Gitk" FALSE "14" "Filezilla" FALSE "15" "NodeJS" FALSE "16" "Yo / GruntJs / Bower (Requer NodeJS)" --separator=":" --width=750 --height=600)


if [[ $resposta == "1" ]]; then
 sudo apt-get -y install ubuntu-restricted-extras
fi


if [[ $resposta == "2" ]]; then
 sudo apt-get -y install gimp
fi

if [[ $resposta == "3" ]]; then
 sudo apt-get -y install inkscape
fi

if [[ $resposta == "4" ]]; then
 sudo apt-get -y install imagemagick
fi

if [[ $resposta == "5" ]]; then
  # adicionando repositório
 sudo add-apt-repository ppa:webupd8team/sublime-text-2
 sudo apt-get update
 sudo apt-get -y install sublime-text
fi

if [[ $resposta == "6" ]]; then
  # adicionando repositório
  sudo add-apt-repository ppa:webupd8team/sublime-text-3
  sudo apt-get update 
  sudo apt-get -y install sublime-text-installer
fi

if [[ $resposta == "7" ]]; then
  # adicionando repositório
	sudo add-apt-repository ppa:webupd8team/brackets
	sudo apt-get update
	sudo apt-get -y install brackets
fi

if [[ $resposta == "8" ]]; then
 sudo apt-get -y install nautilus-dropbox
 #instalando indicador da barra de tarefas
 sudo apt-get -y install libappindicator1
fi   

if [[ $resposta == "9" ]]; then
 sudo apt-get -y install mysql-workbench
fi   

if [[ $resposta == "10" ]]; then
  # instalando lamp e phpmyadmin
  sudo apt-get -y install lamp-server^
  sudo apt-get -y install phpmyadmin
  # criando um link virtual
  sudo ln -s /usr/share/phpmyadmin/ /var/www/
  # dando permissão de todas as pastas para maior controle
  sudo chmod -R 777 /var/www   
fi   

if [[ $resposta == "11" ]]; then
 sudo apt-get -y install chromium-browser
fi   

if [[ $resposta == "12" ]]; then
  # baixando a chave do chrome para adicionar nas chaves de repositórios
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  # adicionando na lista de fontes
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
  sudo apt-get update
  sudo apt-get install google-chrome-stable
fi   

if [[ $resposta == "13" ]]; then
  sudo apt-get install git-core gitk
fi

if [[ $resposta == "14" ]]; then
  sudo apt-get install filezilla
fi

if [[ $resposta == "15" ]]; then
  # instalando dependências
  sudo apt-get install -y python-software-properties python g++ make
  # adicionando repositório
  sudo add-apt-repository -y ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install -y nodejs
fi

if [[ $resposta == "14" ]]; then
  sudo npm install -g yo grunt-cli bower
fi

zenity --info --title "Instalação Finalizada" --text "Instalação Finalizada com sucesso!"
