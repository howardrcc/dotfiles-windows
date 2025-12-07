
#choco install powershell-core
#choco install alacritty
choco install fzf ripgrep bat
choco install mingw 
choco install googlechrome  firefox
choco install microsoft-windows-terminal 
choco install git tortoisegit
choco install vscode #neovim

#download fonts.

winget install wez.wezterm                                           
winget install Microsoft.PowerShell                                  
winget install JanDeDobbeleer.OhMyPosh                               

#window manager + statusbar
winget install --id AmN.yasb                                         
winget install LGUG2Z.whkd                                           
winget install LGUG2Z.komorebi                                       


Install-Module z -AllowClobber
Install-Module -Name Terminal-Icons -force

 
#remove-item -path C:\Users\howie\Documents\PowerShell\Modules\Terminal-Icons\ -recurse -force

#personal
#git config --global user.email "howardchingchung@gmail.com"
#git config --global user.name "howardcc"

#radboud
git config --global user.email "howard.chingchung@radboudumc.nl"
git config --global user.name "howardcc"


# PSReadLine
# see github for instructions
# you may need to install/update it from cmd.exe because it's in use 
# powershell -noprofile -command "Install-Module PSReadLine -AllowPrerelease"
# otherwise try: Install-Module PSReadLine -AllowPrerelease -Force
#curl wget https://github.com/PowerShell/PSReadLine/archive/refs/tags/v2.2.5.zip -O

#need 2.2.5
#$(get-module PSReadLine).Version
#Remove-Module PSReadLine


#copy Profile.ps1 to users\documents\powershell dir C:\Users\Howie\Documents\PowerShell and change settings
# Profle.ps1 contains psreadline functions that are loaded everytime powershell is started.

#winget install ZoomIt
#curl https://live.sysinternals.com/ZoomIt.exe -O
#Invoke-WebRequest https://live.sysinternals.com/ZoomIt.exe -PassThru -Outfile Zoomit.Exe
