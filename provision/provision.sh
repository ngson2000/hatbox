#!/bin/sh
set -e
if [ -e /.installed ]; then
  echo 'Already installed.'

else

  echo '|---------------|'
  echo '| START INSTALL |'
  echo '|---------------|'

  # Update apt-get
  echo ' |'
  echo ' |'
  echo ' |'
  echo ' |Update apt-get'
  echo ' |---------------|'
  apt-get -y -qq update >/dev/null
  echo ' \ '

  # Install PHP, Curl, and git
  echo ' |'
  echo ' |'
  echo ' |'
  echo ' |Install PHP, Curl, and git'
  echo ' |---------------------------|'
  apt-get -y -qq install curl php5 php-apc php5-cli php5-curl git >/dev/null
  echo ' \ '
  # Install Java, Chrome, Xvfb, and unzip
  echo ' |'
  echo ' |'
  echo ' |'
  echo ' |Install Java, Xvfb, and unzip'
  echo ' |-------------------------------------|'
  pack1="libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4"
  pack2="openjdk-7-jre-headless xvfb unzip firefox"
  apt-get -y -qq install $pack1 $pack2  >/dev/null
  echo ' \ '
  # Install ependencies to make "headless" chrome/selenium work
  echo ' |'
  echo ' |'
  echo ' |'
  echo ' |Install dependencies to make "headless" selenium work'
  echo ' |------------------------------------------------------|'
  pack3="xvfb gtk2-engines-pixbuf"
  pack4="xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable"
  # For capturing screenshots of Xvfb display
  pack5="imagemagick x11-apps"
  apt-get -y -qq install $pack3 $pack4 $pack5  >/dev/null
  echo ' \ '
  # Download and copy the ChromeDriver to /usr/local/bin
  echo ' |'
  echo ' |'
  echo ' |'
  echo ' |Install Selenium Driver'
  echo ' |--------------------------------------|'
  cd /tmp

  wget -q http://selenium-release.storage.googleapis.com/2.42/selenium-server-standalone-2.42.2.jar
  mv selenium-server-standalone-2.42.2.jar /usr/local/bin/selenium-server.jar

  echo ' \ '
  # Add bashrc entry to cd to /vagrant on ssh.
  echo 'cd /vagrant' >> /home/vagrant/.bashrc

  # So that running `vagrant provision` doesn't redownload everything
  touch /.installed
  echo '|---------------|'
  echo '|  END INSTALL  |'
  echo '|---------------|'
fi

# Start Xvfb, and Selenium
cd /vagrant/scripts
sh selenium_start.sh
