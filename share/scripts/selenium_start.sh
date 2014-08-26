#!/bin/bash

echo 'Stop any running instance of selenium.'
sudo sh selenium_stop.sh
sleep 5
echo 'Stop any running instance of xvfb.'
sudo sh xvfb_control.sh stop
sleep 5
echo 'Remove old xvfb locks.'
sudo rm -rf /tmp/.X*-lock
sleep 5
echo 'Start xvfb.'
sudo sh xvfb_control.sh start
sleep 5
echo 'Start selenium.'
export DISPLAY=:99
sudo java -jar /usr/local/bin/selenium-server.jar > /tmp/selenium_server.log 2>&1 &
echo "waiting for Selenium server to finish loading"
sleep 5
echo "Ready"
