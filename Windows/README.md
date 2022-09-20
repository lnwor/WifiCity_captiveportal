# Windows version

## How to Use 

Download the `WifiCity_win.bat` script and execute it.\
It should ask you your username and password to generate a `login_WifiCity.bat`
file which, if executed, will connect to the WifiCity network.

An example of the generated file is provided.

## Automation

It's possible to automate the execution of the script every time Windows
connects to the WifiCity network, but unfortunately Windows sucks and I couldn't
find any built-in tools that could work reliably.

A possible implementation can involve the Task Scheduler, but it will trigger
the action so slowly that connecting manually would be much faster.

It's also possible to write a small script that would run at startup, using the
AutoRun registry value, but it will have to constantly check when you are
connected to the network, so that it will login to the captive portal soon
enough for you not to notice. This is an awful implementation that would be much
better if there was a way to listen for system events, but I couldn't find one
(I don't know Windows that much).
