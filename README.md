# Windows Dotfiles - Automatische Werkplek Setup

Deze repository bevat scripts voor het automatisch installeren en configureren van een Windows 11 ontwikkelwerkplek.

## Snelstart

### 1. Eenmalige Voorbereiding

Stel de execution policy in (tijdelijk op Unrestricted zodat je .ps1 scripts kan uitvoeren):

```powershell
Set-ExecutionPolicy Unrestricted -Force
```

### 2. Initiële Setup

Voer eerst `start_here.ps1` uit:

```powershell
.\start_here.ps1
```

Dit script:
- Zet Windows 11 context menu terug naar Windows 10 stijl
- Verwijdert Microsoft VFS Git en installeert standaard Git
- Kloont deze repository van Azure DevOps

### 3. Installeer Package Managers

```powershell
.\install_scoop.ps1    # User-level package manager (geen admin rechten nodig)
.\install_choco.ps1    # System-level package manager (vereist admin)
```

Na Chocolatey installatie, laad de environment opnieuw:

```powershell
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
refreshenv
```

### 4. Installeer Core Applicaties

```powershell
choco feature enable -n allowGlobalConfirmation
.\install_coreapps.ps1
```

Dit installeert:
- **Development tools**: Git, TortoiseGit, VSCode, Neovim, Node.js
- **PowerShell**: PowerShell Core, PowerToys
- **Databases**: SQL Server Management Studio
- **Browsers**: Chrome, Firefox, Zen Browser
- **Utilities**: 7zip, Obsidian, Syncthing, ZoomIt, fzf
- **Window Manager**: komorebi, whkd, yasb, WezTerm

### 5. Configureer PowerShell Terminal

```powershell
.\configure_powershell.ps1
```

Dit installeert en configureert:
- PowerShell modules (Terminal-Icons, PSReadLine, z)
- Oh My Posh prompt theme
- Nerd Fonts (CascadiaCode)
- Custom Profile.ps1 met handige shortcuts

### 6. Optioneel: Python Ontwikkelomgeving

```powershell
.\install_python.ps1
```

Installeert Python 3.12.4 met virtualenv en data science packages (numpy, pandas, fastparquet, sqlalchemy).

### 7. Optioneel: Visual Studio

```powershell
.\install_visualstudio.ps1
```

Installeert Visual Studio 2022 Enterprise.

**Let op**: Voor tabular model development heb je de "Microsoft Analysis Services Modeling Projects" extensie nodig van de marketplace.

### 8. Git Configuratie

```powershell
.\set_git_config.ps1
```

Configureert Git met Radboudumc credentials.

## Package Managers

Deze repository gebruikt drie package managers:

| Package Manager | Gebruik | Admin Rechten | Installatie |
|----------------|---------|---------------|-------------|
| **Scoop** | User-level apps (fzf, wezterm) | ❌ Nee | `install_scoop.ps1` |
| **Chocolatey** | System-level apps (meeste packages) | ✅ Ja | `install_choco.ps1` |
| **Winget** | Officiële Windows package manager | Varies | Pre-geïnstalleerd in Win11 |

### Chocolatey Packages Zoeken

Bekijk https://community.chocolatey.org/packages voor beschikbare packages.

### Winget App Installer

Als winget niet werkt, installeer App Installer via Microsoft Store:
https://www.microsoft.com/p/app-installer/9nblggh4nns1

Of check: https://github.com/microsoft/winget-cli

## Handige PowerShell Profile Features

De `Profile.ps1` bevat vele custom key bindings:

| Shortcut | Functie |
|----------|---------|
| **↑/↓** | Zoek in command history |
| **F7** | Toon volledige command history in grid |
| **Ctrl+Shift+B** | `dotnet build` |
| **Ctrl+Shift+T** | `dotnet test` |
| **Ctrl+J** + key | Markeer huidige directory |
| **Ctrl+j** + key | Spring naar gemarkeerde directory |
| **Alt+a** | Selecteer command argument |
| **Alt+'** | Toggle quotes op argument |
| **RightArrow** | Accept volgende word van suggestion |

## PowerShell Profile Symlink (Handmatig)

Als je een symlink wilt maken naar Profile.ps1:

```powershell
New-Item -Path "C:\Users\<USERNAME>\Documents\Powershell\profile.ps1" `
         -ItemType "SymbolicLink" `
         -Value "C:\workspace\dotfiles-windows\Profile.ps1"
```

## Komorebi Window Manager

Deze setup installeert een tiling window manager voor Windows:

- **komorebi** - Tiling window manager
- **whkd** - Hotkey daemon voor shortcuts
- **yasb** - Custom taskbar

Configuratie staat in de `komorebi/` directory:
- `komorebi.json` - Workspace layouts, window rules, monitor settings
- `applications.json` - App-specifieke regels

Windows worden automatisch naar workspaces gerouteerd:
- Browsers → Workspace 0
- VSCode → Workspace 3
- SSMS/Azure Data Studio → Workspace 1
- Outlook → Workspace 4

## VPN Toegang

Voor remote toegang: https://ravpn.radboudumc.nl

## Bekende Issues

### Windows 11 Specifiek
- Context menu moet handmatig terug naar Windows 10 stijl (zie `start_here.ps1`)
- Copy/paste problemen met RDP
- Edge intranet zones - herhaaldelijk inloggen voor Radboudumc intranet

### PowerShell
- PSReadLine update kan mislukken als module in gebruik is. Los op door te installeren vanuit cmd.exe:
  ```cmd
  powershell -noprofile -command "Install-Module PSReadLine -AllowPrerelease"
  ```

### Git
- VFS for Git versie moet eerst verwijderd worden voordat standaard Git geïnstalleerd kan worden

## Repository Locatie

Deze repository wordt beheerd op Azure DevOps:
```
https://radboudumc@dev.azure.com/radboudumc/Business%20Intelligence/_git/dotfiles-windows
```

## Extra Notities

- Font wijzigen in je terminal naar **CascadiaCode Nerd Font Mono** voor correcte icon weergave
- Voor Neovim: LazyVim starter config wordt automatisch geïnstalleerd
- WezTerm config: `.wezterm.lua` wordt naar home directory gekopieerd
