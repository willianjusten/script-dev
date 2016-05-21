#!/bin/bash

# Script para desenvolvedores web no Ubuntu
# Criado por Willian Justen

# Esse script foi escrito usando o zenity e tem
# o objetivo de agilizar a instalação de programas
# básicos no mundo do desenvolvimento web atual.
# É um script bem básico e rápido, sugestões são bem vindas =)

zenity --info --title "Script Web Development" --text "Este é um script simples para instalação de ferramentas úteis para Desenvolvimento Web e do ambiente do Ubuntu. \n\nCriado por: Willian Justen de Vasconcellos"

resposta=$(zenity  --list  --text "Escolha os pacotes que deseja instalar." --checklist  --column "Instalar" --column "Id" --column "Pacote"\
    FALSE "1" "Restricted-Extras (Codecs de áudio e vídeo, plugin flash, java entre outros)"\
    FALSE "2" "Gimp (Editor de Imagens)"\
    FALSE "3" "Inkscape (Editor de Vetores)"\
    FALSE "4" "Imagemagick (Editor de Imagens via Terminal)"\
    FALSE "5" "Terminator"\
    FALSE "6" "Sublime Text 3"\
    FALSE "7" "Brackets"\
    FALSE "8" "Mysql Workbench"\
    FALSE "9" "Lamp+phpmyadmin"\
    FALSE "10" "Google Chromium"\
    FALSE "11" "Google Chrome"\
    FALSE "12" "Git e Gitk"\
    FALSE "13" "Filezilla"\
    FALSE "14" "NodeJS"\
    FALSE "15" "Yo / GruntJs / Bower (Requer NodeJS)"\
    FALSE "16" "RVM e Ruby"\
    FALSE "17" "Pip, Virtualenv e Virtualenvwrapper"\
    FALSE "18" "Spotify"\
    FALSE "19" "Vagrant e VirtualBox with VagrantBox Ubuntu 14.04 64bits"\
    FALSE "20" "Vagrant e VirtualBox without VagrantBox"\
    FALSE "21" "Skype"\
    FALSE "22" "Mailcatcher"\
    FALSE "23" "Htop"\
    --separator=":" --width=750 --height=700)

if [[ $resposta =~ "1" ]]; then
    sudo apt-get -y install ubuntu-restricted-extras
fi

if [[ $resposta =~ "2" ]]; then
    sudo apt-get -y install gimp
fi

if [[ $resposta =~ "3" ]]; then
    sudo apt-get -y install inkscape
fi

if [[ $resposta =~ "4" ]]; then
   sudo apt-get -y install imagemagick
fi

if [[ $resposta =~ "5" ]]; then
    sudo add-apt-repository -y ppa:gnome-terminator
    sudo apt-get update
    sudo apt-get install terminator
fi

if [[ $resposta =~ "6" ]]; then
  # adicionando repositório
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get -y install sublime-text-installer
fi

if [[ $resposta =~ "7" ]]; then
  # adicionando repositório
  sudo add-apt-repository -y ppa:webupd8team/brackets
  sudo apt-get update
  sudo apt-get -y install brackets
fi

if [[ $resposta =~ "8" ]]; then
   sudo apt-get -y install mysql-workbench
fi

if [[ $resposta =~ "9" ]]; then
  # instalando lamp e phpmyadmin
  sudo apt-get -y install lamp-server^
  sudo apt-get -y install phpmyadmin
  # criando um link virtual
  sudo ln -s /usr/share/phpmyadmin/ /var/www/
  # dando permissão de todas as pastas para maior controle
  sudo chmod -R 777 /var/www
fi

if [[ $resposta =~ "10" ]]; then
   sudo apt-get -y install chromium-browser
fi

if [[ $resposta =~ "11" ]]; then
  # baixando a chave do chrome para adicionar nas chaves de repositórios
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  # adicionando na lista de fontes
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
  sudo apt-get update
  sudo apt-get install -y google-chrome-stable
fi

if [[ $resposta =~ "12" ]]; then
  sudo apt-get install -y git-core gitk
fi

if [[ $resposta =~ "12" ]]; then
  sudo apt-get install -y filezilla
fi

if [[ $resposta =~ "14" ]]; then
  # instalando dependências
  sudo apt-get install -y python-software-properties python g++ make
  # adicionando repositório
  sudo add-apt-repository -y ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install -y nodejs
  # correção para não precisar rodar em sudo
  echo prefix = ~/.node >> ~/.npmrc
  echo 'export PATH=$HOME/.node/bin:$PATH' >> ~/.bashrc
fi

if [[ $resposta =~ "15" ]]; then
  sudo npm install -g yo grunt-cli bower
fi

if [[ $resposta =~ "16" ]]; then
    sudo apt-get install -y curl
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable
fi

if [[ $resposta =~ "17" ]]; then
  sudo apt-get install -y python-pip
  sudo pip install virtualenv
  sudo pip install virtualenvwrapper
fi

if [[ $resposta =~ "18" ]]; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get update
  sudo apt-get install -y spotify-client
fi

if [[ $resposta =~ "19" ]]; then
  sudo apt-get update
  sudo apt-get install -y virtualbox
  sudo apt-get install -y virtualbox-dkms
  cd ~/Downloads
  wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
  sudo dpkg -i vagrant_1.8.1_x86_64.deb

  mkdir ~/vagrantbox
  cd ~/vagrantbox
  echo '
      # -*- mode: ruby -*-
      # vi: set ft=ruby :
      Vagrant.configure(2) do |config|
        config.vm.box = "ubuntu/trusty64"
        config.vm.network "private_network", ip: "192.168.2.2"
      end

  ' >> Vagrantfile
  vagrant up
fi

if [[ $resposta =~ "20" ]]; then
  sudo apt-get update
  sudo apt-get install -y virtualbox
  sudo apt-get install -y virtualbox-dkms
  cd ~/Downloads
  wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
  sudo dpkg -i vagrant_1.8.1_x86_64.deb
fi

if [[ $resposta =~ "21" ]]; then
  sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list.d/canonical_partner.list'
  sudo apt-get update
  sudo apt-get install -y skype
fi

if [[ $resposta =~ "22" ]]; then
  sudo apt-get update
  sudo apt-get install -y build-essential software-properties-common
  sudo apt-get install -y libsqlite3-dev ruby1.9.1-dev
  sudo gem install mailcatcher
  mailcatcher
  zenity --info --title "Mailcatcher" --text "Requer configuração para cada linguagem, veja em http://mailcatcher.me"
fi

if [[ $resposta =~ "23" ]]; then
  sudo apt-get update
  sudo apt-get install -y htop
fi

if [[ $resposta =~ "24" ]]; then
  cd /opt/
  sudo wget https://ci.popcorntime.sh/job/Popcorn-Time-Desktop/lastSuccessfulBuild/artifact/Release/Popcorn-Time-Linux64.tar.xz
  sudo tar -xJf Popcorn-Time-Linux64.tar.xz
  sudo rm -f Popcorn-Time-Linux64.tar.xz
  sudo mv linux64/ popcorntime/
  # Create Symbolic Link
  sudo ln -s /opt/popcorntime/Popcorn-Time /usr/bin/popcorntime

  # Create Desktop Entry
  desktop=popcorntime.desktop
  echo "[Desktop Entry]" > $desktop
  echo "Name=Popcorn Time" >> $desktop
  echo "GenericName=Media Player" >> $desktop
  echo "Version=0.3.9-0" >> $desktop
  echo "Type=Application" >> $desktop
  echo "Categories=AudioVideo;Player;" >> $desktop
  echo "Icon=/opt/popcorntime/src/app/images/icon.png" >> $desktop
  echo "Exec=/usr/bin/popcorntime" >> $desktop
  echo "Comment=Popcorn Time Official" >> $desktop
  echo "Terminal=false" >> $desktop
  echo "Keywords=Player;Video;Internet;Stream" >> $desktop

  # Move .desktop file to /usr/share/applications
  sudo mv popcorntime.desktop /usr/share/applications/
fi

# removendo os pacotes não necessários
sudo apt-get autoremove

zenity --info --title "Instalação Finalizada" --text "Instalação Finalizada com sucesso!"
