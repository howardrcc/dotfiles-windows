
write-host 'see README.md for instructions!'
 
# https://ravpn.radboudumc.nl


.\install_scoop.ps1 
.\install_choco.ps1

Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
refreshenv

choco feature enable -n allowGlobalConfirmation

#basics 
choco install git
choco install tortoisegit
choco install 7zip

choco install powershell-core
choco install powertoys
#winget install --id Microsoft.PowerToys  --source winget

# choco install microsoft-windows-terminal  

#IDE
choco install vscode #neovim
choco install neovim

#databases
choco install sql-server-management-studio

#misc
winget install ZoomIt

#browsers 
choco install googlechrome firefox
winget install --id=Zen-Team.Zen-Browser  -e

#note-taking
choco install obsidian

#sync files across devices
choco install syncthing
#curl https://live.sysinternals.com/ZoomIt.exe -O
#Invoke-WebRequest https://live.sysinternals.com/ZoomIt.exe -PassThru -Outfile Zoomit.Exe

#development/neoim

choco install nodejs -y
npm install -g tree-sitter-cli

#neovim yank
winget install equalsraf.win32yank


#c compiler
winget install --id=BrechtSanders.WinLibs.POSIX.UCRT -e

#andere utilities
#choco install fzf
scoop install fzf

#window manager

#taskbar
winget install --id AmN.yasb

#windowmanager
winget install -e --id LGUG2Z.komorebi

#shortcut/hotkeys
winget install LGUG2Z.whkd

#scoop apps
scoop bucket add extras
scoop install wezterm
#choco install wezterm -y

#claude code 
npm install -g @anthropic-ai/claude-code

scoop bucket add extras
scoop install extras/obsidian

#ssms
