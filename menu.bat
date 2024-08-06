@echo off
title Executor Menu
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/c cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
cd bin
goto Start
:Start
cls
echo Roblox Executor Menu - Clipflip
echo.
echo.
echo [1] Open Executor Installer
echo [2] Open Executor Fixer
echo [3] Exit
echo.

choice /c 123 /m "Enter your choice:"
if errorlevel 3 goto Exit
if errorlevel 2 goto Fixer
if errorlevel 1 goto Installer

:Fixer
powershell -command "(New-Object System.Net.WebClient).DownloadFile(\"https://raw.githubusercontent.com/clipflip-rblx/custom-installer/main/Fixer.bat\", \"launchfix.bat\"); Start-Process -FilePath Launchfix.bat"
goto Exit

:Installer
goto Start

:Exit
exit
