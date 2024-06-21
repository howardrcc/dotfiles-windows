
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

#personal
git config --global user.email "howardchingchung@gmail.com"
git config --global user.name "howardcc"

#radboud
#git config --global user.email "howard.chingchung@radboudumc.com"
#git config --global user.name "howardcc"