:: == WELCOME ==
@echo off
title Lockout Timer
echo ===================================================
echo                  ~ Lockout Timer ~
echo.
echo                  Made By Aerobiker
echo ===================================================
echo.



:: == INITIALIZATION ==
:: Tries for input befor quitting
set /a ite = 2



:: == TIME INPUT ==
:Input
set /a ite = %ite% - 1
if %ite% LSS 0 goto Escape

echo  (!) After starting the timer, a countdown will begin in seconds (don't be scared of the number),
echo  after the counter finishes, your pc will lockout ! Useful for afk sessions or a more strict timer.
echo.
set /p TimeHours=">> Please input 'Hours'   : "
set /p TimeMinutes=">> Please input 'Minutes' : "
set /p TimeSeconds=">> Please input 'Seconds' : "



:: == VALIDATE TIME-CHECK ==
set /a Hours   = %TimeHours% + 0
set /a Minutes = %TimeMinutes% + 0
set /a Seconds = %TimeSeconds% + 0
set /a check   = %Hours% + %Minutes% + %Seconds%

if %check% EQU 0 goto WrongInput
if %Hours% LSS 0 goto WrongInput
if %Minutes% LSS 0 goto WrongInput
if %Seconds% LSS 0 goto WrongInput



:: == TIMER ==
set /a t = %Seconds% + 60*%Minutes% + 3600*%Hours%
echo.
echo Press 'Enter' to start timer (%t% Seconds) :
pause
timeout %t%



:: == ERROR HANDLING ==
goto Exit

:WrongInput
cls
echo.
echo ----------------------------------------------------------------------------------
echo  ^>^> Wrong Time Entry ^<^< -- Please insert a non 0 time or any non negative number !
echo ----------------------------------------------------------------------------------
echo.
goto Input



:: == END OF TIMER ==
:Exit
rundll32.exe user32.dll,LockWorkStation



:: == END PROGRAM EARLY ==
:Escape
