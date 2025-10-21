# PowerShell Terminal Setup Script
# Installeert en configureert een volledige terminal omgeving

Write-Host "=== PowerShell Terminal Setup ===" -ForegroundColor Cyan

# 1. Install Oh My Posh
Write-Host "`nInstalleren Oh My Posh..." -ForegroundColor Yellow
winget install JanDeDobbeleer.OhMyPosh --source winget --scope user --force

# 2. Install PowerShell Modules
Write-Host "`nInstalleren PowerShell modules..." -ForegroundColor Yellow
Install-Module -Name Terminal-Icons -Force -SkipPublisherCheck
Install-Module -Name PSReadLine -Force -AllowPrerelease -SkipPublisherCheck
Install-Module -Name z -AllowClobber -Force -SkipPublisherCheck

# 3. Download and Extract Nerd Font
Write-Host "`nDownloaden CascadiaCode Nerd Font..." -ForegroundColor Yellow
$fontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip"
$fontZip = "CascadiaCode.zip"
$fontDir = "font"

if (!(Test-Path $fontZip)) {
    Invoke-WebRequest -Uri $fontUrl -OutFile $fontZip
    Write-Host "Font gedownload naar $fontZip" -ForegroundColor Green
} else {
    Write-Host "Font zip bestaat al, overslaan download" -ForegroundColor Gray
}
invoke-webrequest -Uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip -OutFile "Hacknerd.zip"

# Extract font (vereist 7zip)
if (Test-Path $fontZip) {
    if (Get-Command 7z -ErrorAction SilentlyContinue) {
        7z x $fontZip -o"$fontDir" -y
        Write-Host "Font uitgepakt naar $fontDir" -ForegroundColor Green
    } else {
        Write-Host "7zip niet gevonden. Pak $fontZip handmatig uit en installeer de fonts." -ForegroundColor Yellow
    }
}

# 4. Setup PowerShell Profile Directory
Write-Host "`nConfigureren PowerShell profile directory..." -ForegroundColor Yellow
$profilePath = Split-Path $profile.CurrentUserAllHosts

if (!(Test-Path $profilePath)) {
    New-Item -ItemType Directory -Path $profilePath -Force | Out-Null
    Write-Host "Profile directory aangemaakt: $profilePath" -ForegroundColor Green
} else {
    Write-Host "Profile directory bestaat al: $profilePath" -ForegroundColor Gray
}

# 5. Copy Profile and Theme Files
Write-Host "`nKopiëren profile en theme bestanden..." -ForegroundColor Yellow
$filesToCopy = @(
    @{Source = "Profile.ps1"; Destination = $profilePath}
    @{Source = "ohmyposhv3-v2.json"; Destination = $profilePath}
)

foreach ($file in $filesToCopy) {
    $sourcePath = Join-Path $PSScriptRoot $file.Source
    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination $file.Destination -Force
        Write-Host "  ✓ $($file.Source) gekopieerd" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $($file.Source) niet gevonden" -ForegroundColor Red
    }
}

# 6. Copy WezTerm Config to User Profile
Write-Host "`nKopiëren WezTerm configuratie..." -ForegroundColor Yellow
$weztermConfig = Join-Path $PSScriptRoot ".wezterm.lua"
if (Test-Path $weztermConfig) {
    Copy-Item -Path $weztermConfig -Destination $env:USERPROFILE -Force
    Write-Host "  ✓ .wezterm.lua gekopieerd naar $env:USERPROFILE" -ForegroundColor Green
} else {
    Write-Host "  ✗ .wezterm.lua niet gevonden" -ForegroundColor Yellow
}

# 7. Optional: Clone LazyVim for Neovim
Write-Host "`nOptional: LazyVim installeren voor Neovim?" -ForegroundColor Yellow
$installLazyVim = Read-Host "LazyVim installeren? (y/N)"
if ($installLazyVim -eq 'y' -or $installLazyVim -eq 'Y') {
    $nvimPath = "$env:LOCALAPPDATA\nvim"

    if (Test-Path $nvimPath) {
        Write-Host "Neovim config bestaat al in $nvimPath" -ForegroundColor Yellow
        $overwrite = Read-Host "Overschrijven? (y/N)"
        if ($overwrite -ne 'y' -and $overwrite -ne 'Y') {
            Write-Host "LazyVim installatie overgeslagen" -ForegroundColor Gray
        } else {
            Remove-Item $nvimPath -Recurse -Force
            git clone https://github.com/LazyVim/starter $nvimPath
            Remove-Item "$nvimPath\.git" -Recurse -Force
            Write-Host "  ✓ LazyVim geïnstalleerd" -ForegroundColor Green
        }
    } else {
        git clone https://github.com/LazyVim/starter $nvimPath
        Remove-Item "$nvimPath\.git" -Recurse -Force
        Write-Host "  ✓ LazyVim geïnstalleerd" -ForegroundColor Green
    }
} else {
    Write-Host "LazyVim installatie overgeslagen" -ForegroundColor Gray
}

# 8. Final Instructions
Write-Host "`n=== Setup Voltooid ===" -ForegroundColor Cyan
Write-Host "`nVolgende stappen:" -ForegroundColor Yellow
Write-Host "1. Wijzig de font in je terminal naar 'CascadiaCode Nerd Font Mono'" -ForegroundColor White
Write-Host "   - Voor Windows Terminal: Settings > Profiles > Defaults > Appearance > Font face" -ForegroundColor Gray
Write-Host "   - Voor WezTerm: Configuratie staat al in .wezterm.lua" -ForegroundColor Gray
Write-Host "2. Herstart je PowerShell terminal om de nieuwe profile te laden" -ForegroundColor White
Write-Host "3. Als PSReadLine errors geeft, installeer vanuit cmd.exe:" -ForegroundColor White
Write-Host "   powershell -noprofile -command `"Install-Module PSReadLine -AllowPrerelease -Force`"" -ForegroundColor Gray
Write-Host ""

# Optional: Show installed module versions
Write-Host "Geïnstalleerde module versies:" -ForegroundColor Cyan
$modules = @('Terminal-Icons', 'PSReadLine', 'z')
foreach ($mod in $modules) {
    $version = (Get-Module -Name $mod -ListAvailable | Select-Object -First 1).Version
    if ($version) {
        Write-Host "  $mod : $version" -ForegroundColor Green
    } else {
        Write-Host "  $mod : niet gevonden" -ForegroundColor Red
    }
}
