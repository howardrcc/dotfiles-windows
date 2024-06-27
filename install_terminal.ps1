#use this script to install a decent terminal

#optional alacritty + neovim in addition to windows-terminal and vscode
#choco install alacritty neovim fzf ripgrep bat install mingw 

#download fonts
winget install JanDeDobbeleer.OhMyPosh

Install-Module z -AllowClobber -Confirm
Install-Module -Name Terminal-Icons -Confirm

#copy profile / theme to Documents\Powershell\...
$docs = $([Environment]::GetFolderPath("mydocuments"))

#for powershell 7 this is the path:
$prof = Join-Path -Path $docs -ChildPath 'Powershell\'
cp Profile.ps1 $prof
cp ohmyposhv3-v2.json $prof

#download and install font or check https://www.nerdfonts.com/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip -OutFile CascadiaCode.zip

#change font in the shell you use to CascadiaCode Nerd Font Mono



#optional stuff

# PSReadLine
# see github for instructions
# you may need to install/update it from cmd.exe because it's in use 
# powershell -noprofile -command "Install-Module PSReadLine -AllowPrerelease"
# otherwise try: Install-Module PSReadLine -AllowPrerelease -Force
#curl wget https://github.com/PowerShell/PSReadLine/archive/refs/tags/v2.2.5.zip -O

# to check for (old) versions (need 2.2.5)
#$(get-module PSReadLine).Version
#Remove-Module PSReadLine
