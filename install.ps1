
choco install powershell-core
#or windows-terminal
choco install alacritty
choco install fzf ripgrep bat
choco install mingw 

#download fonts
winget install JanDeDobbeleer.OhMyPosh

Install-Module z -AllowClobber
Install-Module -Name Terminal-Icons

$docs = $([Environment]::GetFolderPath("mydocuments"))
$prof = Join-Path -Path $docs -ChildPath 'Powershell'

cp Profile.ps1 $prof
cp ohmyposhv3-v2.json $prof

#personal
git config --global user.email "howardchingchung@gmail.com"
git config --global user.name "howardcc"

#radboud
#git config --global user.email "howard.chingchung@radboudumc.com"
#git config --global user.name "howardcc"


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
