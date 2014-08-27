#!/bin/sh
set -e
if [ -e .php_unit_installed ]; then
  echo 'PHPUnit already installed.'

else
  echo '|-----------------------|'
  echo '| START PHPUnit INSTALL |'
  echo '|-----------------------|'
  # Can add --prefer-source if timeouts occur.
  composer_cmd="global require --no-progress --no-interaction -q"
  # Install PHPUnit and PHPUnit_Selenium.
  echo ' |'
  echo ' |'
  echo ' |'
  echo ' |Install PHPUnit and PHPUnit_Selenium'
  echo ' |------------------------------------|'
  composer $composer_cmd "phpunit/phpunit=4.2.*"
  echo '   |'
  echo '   |'
  echo '   |------phpunit/phpunit'
  echo '   /'
  composer $composer_cmd "phpunit/phpunit-selenium=1.2.*"
  echo '   |'
  echo '   |'
  echo '   |------phpunit/phpunit-selenium'
  echo '   /'
  echo '  /'
  echo ' /'
  echo ' \ '


  # So that running `vagrant provision` doesn't redownload everything
  touch .php_unit_installed
  echo '|-----------------------|'
  echo '|  END PHPUnit INSTALL  |'
  echo '|-----------------------|'
fi
