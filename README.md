
# Install windows applications, package-manager, dotfiles, etc

Set Execution policity (temporarily to unrestricted so you can run .ps1 script-files).
You also need it for using the ETL-client

```powershell
Set-ExecutionPolicy Unrestricted -Force;
```


In order to install chocolate package manager run in administrative powershell:

```powershell
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

then run ./install.ps1
see https://community.chocolatey.org/packages for more packages


# install winget package manager from ms store

If the link below doesnt work, check https://github.com/microsoft/winget-cli
https://www.microsoft.com/p/app-installer/9nblggh4nns1

#not working on win 11
Copy/pasting files with RDP
Intranet Zones in Edge - steeds opnieuw inloggen voor intranet radboudumc

# create a symlink in powershell

New-Item -Path "C:\Users\Z157425\Documents\Powershell\profile.ps1" -Item "SymbolicLink" -Value "C:\workspace\dotfiles-windows\Profile.ps1"

New-Item -Path "C:\Path\To\Link" -ItemType "SymbolicLink" -Value "C:\Path\To\Target"
