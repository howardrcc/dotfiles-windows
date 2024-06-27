
# Install windows applications, package-manager, dotfiles, etc

In order to install chocolate package manager run in administrative powershell:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

then run ./install.ps1


# install winget package manager from ms store
# https://github.com/microsoft/winget-cli
# https://www.microsoft.com/p/app-installer/9nblggh4nns1