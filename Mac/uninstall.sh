#!/bin/bash
launchctl unload -w ~/Library/LaunchAgents/me.wificity.login.plist
sudo rm -f /usr/local/bin/login_wificity.sh
