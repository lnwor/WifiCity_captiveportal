# WifiCity_captiveportal

Tired to enter your credential every time you connect to WifiCity, these scripts are made for you.

The main goal of this repository is to offer a solution to connect automatically on internet while the computer is connected at the CIUP wifi called WifiCity.

I made the Windows instruction more user-friendly, if you use linux you are
supposed to know how to edit a text file or change file mode bits.


## How to use

### Windows

* Download `WifiCity\_win.bat` and execute it.
* Insert Username and Password.
* From now on, you can execute the generated `login\_WifiCity.bat` file to
connect to the captive portal without inserting or opening anything.

### Linux

* Open the Linux folder and download `login_wifi.sh`
* Edit the file with your own credential
* Automate the execution of the script every time you connect to a wifi called
"WifiCity"

NetworkManager has the ability to start services when you connect to a network and stop them when you disconnect (e.g. when using NFS, SMB and NTPd).

To activate the feature you need to enable and start the `NetworkManager-dispatcher.service`.
```bash=
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl start NetworkManager-dispatcher.service
```

Once the service is active, scripts can be added to the `/etc/NetworkManager/dispatcher.d` directory.

```bash=
#copy your script to that directory
cp ./WifiCity_captiveportal/Linux/10-login_citywifi /etc/NetworkManager/dispatcher.d/10-login_citywifi
```

Scripts must be owned by root, otherwise the dispatcher will not execute them. For added security, set group ownership to root as well: 
```bash=
chown root:root /etc/NetworkManager/dispatcher.d/10-login_wifi.sh
chmod 755 /etc/NetworkManager/dispatcher.d/10-login_wifi.sh
```

Then reboot and it will automatically execute your script while connected to a network.


### Mac

The linux script should work for Mac as well. Nevertheless no work have been done to execute the script automatically while connected to a network. One idea is to use [ControlPlane](https://www.controlplaneapp.com/) to triger connexion to a wifi and then automatically execute the script.

### Android

Execute the linux script with [`Termux`](https://play.google.com/store/apps/details?id=com.termux&fbclid=IwAR0VU0hSW3z2qZTTrm0dH72awzus8Sy-hZXMOPSG6mdUe5M2cq5zRYW0Q8o) and use this [widget](https://play.google.com/store/apps/details?id=com.termux.widget&fbclid=IwAR0rr7g7ghvPZ8juKe1ses1xXTzq50hbIcUDUcbozzb87_pKllknFPW8TBQ) to execute it from home screen.

### IOS

One idea is to use the app ***Shortcuts*** but with ios 12 it doesn't seem to be possible but it might be with most recent version of ios.
