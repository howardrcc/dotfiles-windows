#get font
invoke-webrequest -Uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip -OutFile "CascadiaCode.zip"
7z CascadiaCode.zip -o'font'

git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

$profile
$x = $profile.CurrentUserAllHosts 


$path = Split-Path $profile.CurrentUserAllHosts 
if (!$(test-path $path)){
    mkdir $path
}

cp profile.ps1 "$path\" -force
cp ohmyposhv3-v2.json "$path\" -force
cp .wezterm.lua "$env:USERPROFILE\" -force

install-module Terminal-Icons -Force
install-module PSReadLine -Force
winget install JanDeDobbeleer.OhMyPosh --source winget --scope user --force