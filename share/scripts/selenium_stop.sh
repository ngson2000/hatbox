#!/bin/bash

echo "Shutting down Selenium server."
wget -O - -q -t 1 http://127.0.0.1:4444/selenium-server/driver/?cmd=shutDownSeleniumServer
