
write-host 'see README.md for instructions!'
write-host ''
write-host 'install winget package manager from ms store'
write-host 'https://github.com/microsoft/winget-cli'
write-host 'https://www.microsoft.com/p/app-installer/9nblggh4nns1'
write-host ''
write-host 'install chocolatey package manager'
write-host 'has to be run or copied directly into terminal administrative mode'
write-host ''
write-host 'Set-ExecutionPolicy Unrestricted -Force (or [A]ccept)'
write-host 'the run: Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))'

# https://ravpn.radboudumc.nl

choco feature enable -n allowGlobalConfirmation

choco install powershell-core
choco install googlechrome  firefox
choco install microsoft-windows-terminal  
choco install git tortoisegit
choco install vscode #neovim
choco install sql-server-management-studio