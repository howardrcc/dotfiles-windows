# Oh My Posh
winget install JanDeDobbeleer.OhMyPosh

#$env:POSH_THEMES_PATH

# command for $profile
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"

Install-Module z -AllowClobber
Install-Module -Name Terminal-Icons
#Import-Module Terminal-Icons


#PSReadLine
#Install-Module PSReadLine -AllowPrerelease -Force
curl wget https://github.com/PowerShell/PSReadLine/archive/refs/tags/v2.2.5.zip -O


#winget install ZoomIt
curl https://live.sysinternals.com/ZoomIt.exe -O
#Invoke-WebRequest https://live.sysinternals.com/ZoomIt.exe -PassThru -Outfile Zoomit.Exe
