@echo off
title Executor Installer
goto Start
:Start
cls
echo Executor Installer
echo By dsc.gg/clipflip
echo.
echo.
echo [1] Open BetterCelery Installer
echo [2] Install Solara
echo [3] Install Wave
echo [4] Exit
echo.
choice /c 1234 /m "Enter your choice:"
if errorlevel 4 goto Exit
if errorlevel 3 goto Wave
if errorlevel 2 goto Solara
if errorlevel 1 goto BetterCelery

:BetterCelery
powershell -command "irm 'https://bcelery.github.io/a' | iex"
pause

:Solara
mkdir %localappdata%\Solara
powershell -command "Invoke-WebRequest -Uri 'https://solaraweb.vercel.app/download/executable/Bootstrapper.exe' -OutFile $env:LOCALAPPDATA\Solara\Bootstrapper.exe"
mklink %userprofile%\Desktop\Solara %userprofile%\AppData\Local\Solara\Bootstrapper.exe
goto Start

:Wave
mkdir %temp%\ExecutorInstaller
powershell -command "(new-object System.Net.WebClient).DownloadFile('https://solaraweb.vercel.app/download/executable/Bootstrapper.exe', \"$env:temp\ExecutorInstaller\Bootstrapper.exe\")"
%temp%\ExecutorInstaller\WaveInstaller.exe
del /s /q %temp%\ExecutorInstaller\WaveInstaller.exe
:Exit
rd /s /q %temp%\ExecutorInstaller
exit