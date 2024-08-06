@echo off
title Executor Fixer
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/c cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
cd bin
goto Start
:Start
cls
echo Welcome to Executor Fixer!
echo Version 1.00
echo Made by dsc.gg/clipflip
echo.
echo.
echo [1] Install dependencies (fix most errors)
echo [2] Fix Solara
echo [3] Fix Datamodel Errors
echo [4] Attempt to Fix Celery
echo [5] Exit
echo.

choice /c 12345 /m "Enter your choice:"
if errorlevel 5 goto Exit
if errorlevel 4 goto FixCelery
if errorlevel 3 goto FixDatamodel
if errorlevel 2 goto FixSolara
if errorlevel 1 goto Dependencies
 
:FixDatamodel
cls
echo.
del /q %localappdata%\Roblox\Logs\*
for /d %%x in (%localappdata%\Roblox\Logs\*) do @rd /s /q "%%x"
del /q %localappdata%\Bloxstrap\Logs\*
for /d %%x in (%localappdata%\Bloxstrap\Logs\*) do @rd /s /q "%%x"
cls
echo Fixed Datamodel Not Found successfully!
pause
goto Start
 
:Dependencies
cls
echo.
mkdir %temp%\ExecutorFixer

echo Installing .NET Framework 4.8.1
powershell -command "(new-object System.Net.WebClient).DownloadFile('https://go.microsoft.com/fwlink/?linkid=2203305', \"$env:temp\ExecutorFixer\Framework481.exe\")"
%temp%\ExecutorFixer\Framework481.exe /q /norestart
echo Installed!
del /s /q %temp%\ExecutorFixer\Framework481.exe
echo.

echo Installing .NET Core 3.1.32
if exist "C:\Program Files\dotnet\host\fxr\3.1.32\" (
	echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/b92958c6-ae36-4efa-aafe-569fced953a5/1654639ef3b20eb576174c1cc200f33a/windowsdesktop-runtime-3.1.32-win-x64.exe', \"$env:temp\ExecutorFixer\Core3132.exe\")"
 %temp%\ExecutorFixer\Core3132.exe /q /norestart
 del /s /q %temp%\ExecutorFixer\Core3132.exe
 echo Installed!
)
echo.

echo Installing .NET 8.0.7
if exist "C:\Program Files\dotnet\host\fxr\8.0.7\" (
	echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/bb581716-4cca-466e-9857-512e2371734b/5fe261422a7305171866fd7812d0976f/windowsdesktop-runtime-8.0.7-win-x64.exe', \"$env:temp\ExecutorFixer\Core807.exe\")"
 %temp%\ExecutorFixer\Core807.exe /q /norestart
 echo Installed!
 del /s /q %temp%\ExecutorFixer\Core807.exe
)
echo.

echo Installing .NET 9.0.0 Preview 6
if exist "C:\Program Files\dotnet\host\fxr\9.0.0-preview.6.24327.7\" (
	echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/32b2d8fc-5f11-4773-bb42-953c09def1da/dc794fff482d2d89db656e4e139943fd/windowsdesktop-runtime-9.0.0-preview.6.24327.6-win-x64.exe', \"$env:temp\ExecutorFixer\Core900Preview6.exe\")"
 %temp%\ExecutorFixer\Core900Preview6.exe /q /norestart
 echo Installed!
 del /s /q %temp%\ExecutorFixer\Core900Preview6.exe
)
echo.

echo Installing .NET 5.0.17
if exist "C:\Program Files\dotnet\host\fxr\5.0.17\" (
	echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/3aa4e942-42cd-4bf5-afe7-fc23bd9c69c5/64da54c8864e473c19a7d3de15790418/windowsdesktop-runtime-5.0.17-win-x64.exe', \"$env:temp\ExecutorFixer\Core5017.exe\")"
 %temp%\ExecutorFixer\Core5017.exe /q /norestart
 echo Installed!
 del /s /q %temp%\ExecutorFixer\Core5017.exe
)
echo.

echo Installing .NET 6.0.32
if exist "C:\Program Files\dotnet\host\fxr\6.0.32\" (
	echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/222a065f-5671-4aed-aba9-46a94f2705e2/2bbcbd8e1c304ed1f7cef2be5afdaf43/windowsdesktop-runtime-6.0.32-win-x64.exe', \"$env:temp\ExecutorFixer\Core6032.exe\")"
 %temp%\ExecutorFixer\Core6032.exe /q /norestart
 echo Installed!
 del /s /q %temp%\ExecutorFixer\Core6032.exe
)
echo.

echo Installing .NET 7.0.20
if exist "C:\Program Files\dotnet\host\fxr\8.0.7\" (
	echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/08bbfe8f-812d-479f-803b-23ea0bffce47/c320e4b037f3e92ab7ea92c3d7ea3ca1/windowsdesktop-runtime-7.0.20-win-x64.exe', \"$env:temp\ExecutorFixer\Core7020.exe\")"
 %temp%\ExecutorFixer\Core7020.exe /q /norestart
 echo Installed!
 del /s /q %temp%\ExecutorFixer\Core7020.exe
)
echo.

echo Installing VC Redist 2005 x86
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\8.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
  powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE', \"$env:temp\ExecutorFixer\vc-redist-2005-x86.exe\")"
  %temp%\ExecutorFixer\vc-redist-2005-x86.exe /q
  echo Installed!
  del /s /q %temp%\ExecutorFixer\vc-redist-2005-x86.exe
)
echo.

echo Installing VC Redist 2005 x64
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\8.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE', \"$env:temp\ExecutorFixer\vc-redist-2005-x64.exe\")"
 %temp%\ExecutorFixer\vc-redist-2005-x64.exe /q
 echo Installed!
 del /s /q %temp%\ExecutorFixer\vc-redist-2005-x64.exe
)
echo.

echo Installing VC Redist 2008 x86
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\9.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
  powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe', \"$env:temp\ExecutorFixer\vc-redist-2008-x86.exe\")"
  %temp%\ExecutorFixer\vc-redist-2008-x86.exe /q /norestart
  echo Installed!
  del /s /q %temp%\ExecutorFixer\vc-redist-2008-x86.exe
)
echo.

echo Installing VC Redist 2008 x64
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\9.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe', \"$env:temp\ExecutorFixer\vc-redist-2008-x64.exe\")"
 %temp%\ExecutorFixer\vc-redist-2008-x64.exe /q /norestart
 echo Installed!
 del /s /q %temp%\ExecutorFixer\vc-redist-2008-x64.exe
)
echo.

echo Installing VC Redist 2010 x86
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\10.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe', \"$env:temp\ExecutorFixer\vc-redist-2010-x86.exe\")"
 %temp%\ExecutorFixer\vc-redist-2010-x86.exe /q /norestart
 echo Installed!
 del /s /q %temp%\ExecutorFixer\vc-redist-2010-x86.exe
)
echo.

echo Installing VC Redist 2010 x64
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\10.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe', \"$env:temp\ExecutorFixer\vc-redist-2010-x64.exe\")"
 %temp%\ExecutorFixer\vc-redist-2010-x64.exe /q /norestart
 echo Installed!
 del /s /q %temp%\ExecutorFixer\vc-redist-2010-x64.exe
)
echo.

echo Installing VC Redist 2012 x86
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\11.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
 powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe', \"$env:temp\ExecutorFixer\vc-redist-2012-x86.exe\")"
 %temp%\ExecutorFixer\vc-redist-2012-x86.exe /q /norestart
 echo Installed!
 del /s /q %temp%\ExecutorFixer\vc-redist-2012-x86.exe
)
echo.

echo Installing VC Redist 2012 x64
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\11.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
  powershell -command "(new-object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe', \"$env:temp\ExecutorFixer\vc-redist-2012-x64.exe\")"
  %temp%\ExecutorFixer\vc-redist-2012-x64.exe /q /norestart
  echo Installed!
  del /s /q %temp%\ExecutorFixer\vc-redist-2012-x64.exe
)
echo.

echo Installing VC Redist 2013 x86
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\12.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
  powershell -command "(new-object System.Net.WebClient).DownloadFile('https://aka.ms/highdpimfc2013x86enu', \"$env:temp\ExecutorFixer\vc-redist-2013-x86.exe\")"
  %temp%\ExecutorFixer\vc-redist-2013-x86.exe /q /norestart
  echo Installed!
  del /s /q %temp%\ExecutorFixer\vc-redist-2013-x86.exe
)
echo.

echo Installing VC Redist 2013 x64
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\12.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
  powershell -command "(new-object System.Net.WebClient).DownloadFile('https://aka.ms/highdpimfc2013x64enu', \"$env:temp\ExecutorFixer\vc-redist-2013-x64.exe\")"
  %temp%\ExecutorFixer\vc-redist-2013-x64.exe /q /norestart
  echo Installed!
  del /s /q %temp%\ExecutorFixer\vc-redist-2013-x64.exe
)
echo.

echo Installing VC Redist 2015-2022 x86
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
  powershell -command "(new-object System.Net.WebClient).DownloadFile('https://aka.ms/vs/17/release/vc_redist.x86.exe', \"$env:temp\ExecutorFixer\vc-redist-2015-2022-x86.exe\")"
  %temp%\ExecutorFixer\vc-redist-2015-2022-x86.exe /q /norestart
  echo Installed!
  del /s /q %temp%\ExecutorFixer\vc-redist-2015-2022-x86.exe
)
echo.

echo Installing VC Redist 2015-2022 x64
reg query HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
  powershell -command "(new-object System.Net.WebClient).DownloadFile('https://aka.ms/vs/17/release/vc_redist.x64.exe', \"$env:temp\ExecutorFixer\vc-redist-2015-2022-x64.exe\")"
  %temp%\ExecutorFixer\vc-redist-2015-2022-x64.exe /q /norestart
  echo Installed!
  del /s /q %temp%\ExecutorFixer\vc-redist-2015-2022-x64.exe
)
echo.

echo Installing Node.js
node -v 2> Nul
if "%errorlevel%" == "9009" (
  powershell -command "(new-object System.Net.WebClient).DownloadFile('https://nodejs.org/dist/v20.16.0/node-v20.16.0-x64.msi', \"$env:temp\ExecutorFixer\nodejs.msi\")"
  %temp%\ExecutorFixer\nodejs.msi /quiet /qn /norestart
  echo Installed!
  del /s /q %temp%\ExecutorFixer\nodejs.msi
) else (
    echo Already installed!
)
echo.

echo Installing Microsoft WebView2 Runtime
reg query HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}>nul
if %errorlevel% equ 0 (
  echo Already installed!
) else (
  powershell -command "(new-object System.Net.WebClient).DownloadFile('https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c638b5d5-4b2f-4845-baab-c9f4fd6c58ab/MicrosoftEdgeWebView2RuntimeInstallerX64.exe', \"$env:temp\ExecutorFixer\WebView2.exe\")"
  %temp%\ExecutorFixer\WebView2.exe /silent /install
  echo Installed!
  del /s /q %temp%\ExecutorFixer\WebView2.exe
)
echo.

cls 
echo Removing temporary files
rd /s /q %temp%\ExecutorFixer
cls
echo Installed dependencies! Most executors should work now!
echo Reboot for the changes to take effect.
pause
goto Start

:FixSolara
cls
rd /s /q C:\ProgramData\Solara
cls
echo Fixed Solara successfully!
pause
goto Start

:FixCelery
cls
rd /s /q %temp%\Celery
cls
echo Attempted to fix Celery successfully!
pause
goto Start

:Exit
powershell -command "(New-Object System.Net.WebClient).DownloadFile(\"https://raw.githubusercontent.com/clipflip-rblx/custom-installer/main/menu.bat\", \"menu.bat\"); Start-Process -FilePath menu.bat"
exit
