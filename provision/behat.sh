#!/bin/sh
set -e
if [ -e .behat_installed ]; then
  echo 'Behat already installed.'

else
  echo '|---------------------|'
  echo '| START BEHAT INSTALL |'
  echo '|---------------------|'
  # Can add --prefer-source if timeouts occur.
  composer_cmd="global require --no-progress --no-interaction -q"
  # Install Composer globally
  echo ' |'
  echo ' |'
  echo ' |'
  echo ' |Install Composer globally'
  echo ' |-------------------------|'
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
  echo ' \ '
  # Add Composer vendor path to Paths
  echo '    |'
  echo '    |'
  echo '    |'
  echo '    |Add Composer vendor path to Paths'
  echo '    |---------------------------------|'

  # Add for "vagrant" user
  sed -i '1i export PATH="$HOME/.composer/vendor/bin:$PATH"' $HOME/.bashrc
  echo ' \ '
  # Install Behat and Mink, plus drivers.
  echo ' |'
  echo ' |'
  echo ' |'
  echo ' |Install Behat and Mink, plus drivers'
  echo ' |------------------------------------|'
  composer $composer_cmd "behat/behat=2.4.*"
  echo '   |'
  echo '   |'
  echo '   |------behat/behat'
  echo '   /'
  composer $composer_cmd "behat/mink=1.4.*"
  echo '   |'
  echo '   |'
  echo '   |------behat/mink'
  echo '   /'
  composer $composer_cmd "behat/mink-extension=*"
  echo '   |'
  echo '   |'
  echo '   |------behat/mink-extension'
  echo '   /'
  composer $composer_cmd "behat/mink-goutte-driver=*"
  echo '   |'
  echo '   |'
  echo '   |------behat/mink-goutte-driver'
  echo '   /'
  composer $composer_cmd "behat/mink-selenium2-driver=*"
  echo '   |'
  echo '   |'
  echo '   |------behat/mink-selenium2-driver'
  echo '   /'
  echo '  /'
  echo ' /'
  echo ' \ '


  # So that running `vagrant provision` doesn't redownload everything
  touch .behat_installed
  echo '|---------------------|'
  echo '|  END BEHAT INSTALL  |'
  echo '|---------------------|'
fi
