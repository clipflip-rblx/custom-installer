(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/clipflip-rblx/custom-installer/main/menu.bat", "menu.bat")
Start-Process -FilePath menu.bat
