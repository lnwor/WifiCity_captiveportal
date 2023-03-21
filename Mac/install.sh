#!/bin/bash

set -e

echo -n "Input your WifiCity username: "
read -r USERNAME
echo -n "Input your WifiCity password: "
read -r PASSWORD

sed -i.bu "s/USERNAME=\"\"/USERNAME=\"$USERNAME\"/" ./login_wificity.sh
sed -i.bu "s/PASSWORD=\"\"/PASSWORD=\"$PASSWORD\"/" ./login_wificity.sh
sed -i.bu "s/SOMEWHERE/\/usr\/local\/bin/" ./me.wificity.login.plist

sudo mkdir -p /usr/local/bin/
sudo cp ./login_wificity.sh /usr/local/bin/
cp ./me.wificity.login.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/me.wificity.login.plist

echo -n "For the script to work you need to reboot your mac, do you want to do it now? [y/N] "
read -r response
if test "$response" == "Y" || test "$response" == "y" ; then
  sudo reboot
fi
