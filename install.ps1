
#addons for terminal/powershell
# Oh My Posh 
winget install JanDeDobbeleer.OhMyPosh

#$env:POSH_THEMES_PATH
#dir env:

# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"

Install-Module z -AllowClobber
Install-Module -Name Terminal-Icons
#Import-Module Terminal-Icons

#get a cool font with terminal icons @ www.nerdfonts.com


# PSReadLine
# see github for instructions
# you may need to install/update it from cmd.exe because it's in use 
# powershell -noprofile -command "Install-Module PSReadLine -AllowPrerelease"
# otherwise try: Install-Module PSReadLine -AllowPrerelease -Force
curl wget https://github.com/PowerShell/PSReadLine/archive/refs/tags/v2.2.5.zip -O

#need 2.2.5
$(get-module PSReadLine).Version
#Remove-Module PSReadLine


#copy Profile.ps1 to users\documents\powershell dir C:\Users\Howie\Documents\PowerShell and change settings
# Profle.ps1 contains psreadline functions that are loaded everytime powershell is started.

#winget install ZoomIt
curl https://live.sysinternals.com/ZoomIt.exe -O
#Invoke-WebRequest https://live.sysinternals.com/ZoomIt.exe -PassThru -Outfile Zoomit.Exe
