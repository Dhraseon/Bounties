#!/usr/bin/env bash
# download keys and repo
line="deb http://dl.google.com/linux/chrome/deb/ stable main"
echo $line >> /etc/apt/sources.list
key="https://dl-ssl.google.com/linux/linux_signing_key.pub"
wget $key
key="linux_signing_key.pub*"
# install and update
sudo apt-key add $key
sudo apt-get update
sudo apt-get install google-chrome-stable
rm $key
