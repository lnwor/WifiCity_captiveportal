@echo off


echo Please enter your credential
set /P wificity_login="Login: "
set /P wificity_password="Password: "
CALL :data >.\login_WifiCity.bat
echo.
if exist .\login_WifiCity.bat (
    echo Automatic login script successfully generated
) else (
    echo An error occured, the script ^(login_WifiCity.bat^) was not created.
)
EXIT /B 0

:data
echo: :: Login to WifiCity captive portale
echo:
echo: @echo off
echo:
echo: SETLOCAL ENABLEDELAYEDEXPANSION
echo:
echo: ::CALL :login_wificity login , password
echo:
echo: CALL :login_wificity %wificity_login% , %wificity_password%
echo:
echo: ENDLOCAL
echo: EXIT /B %%ERRORLEVEL%%
echo:
echo: :login_wificity
echo:     set authserver=http://10.254.0.254:1000
echo:     set gen204="http://www.google.com/gen_204"
echo:     set username=%%~1
echo:     set password=%%~2
echo:
echo:     set /A count=1
echo: 
echo:     FOR /F "tokens=*" %%%%g IN ('curl -si %%gen204%%') do (
echo:         if !count! == 1 set gen204_status=%%%%g
echo:         if !count! == 7 (
echo:             FOR /F "tokens=2 delims=?" %%%%I IN ("%%%%g") do (
echo:			      FOR /F  delims^^=^^"^ tokens^=1 %%%%J IN ("%%%%I") do (
echo:				      set magic=%%%%J
echo:				  ) 
echo:			  )
echo:		  )
echo:         set /A count=!count!+1
echo:     )
echo:
echo:     set status=%%gen204_status:~9,3%%
echo: 
echo:     if %%status%% NEQ 204 (
echo:         curl -so NUL "!authserver!/fgtauth?!magic!"
echo:         curl -so NUL "!authserver!" --data "magic=!magic!&username=!username!&password=!password!"
echo:
echo:     )
echo:
echo: EXIT /B 0
EXIT /B 0
