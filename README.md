# 🪟 Windows Dotfiles - Automatische Werkplek Setup

> **Geautomatiseerde setup voor een complete Windows 11 ontwikkelwerkplek bij Radboudumc**

Deze repository bevat PowerShell scripts en configuratiebestanden voor het volledig automatisch opzetten van een professionele ontwikkelomgeving op Windows 11. In plaats van uren handmatig software te installeren en te configureren, automatiseert deze setup alles in een paar commando's.

# TODO
- [ ] Meegeinstalleerde PowerBI (Cloud) uninstalleren/verwijderen
- [x] PowerBI reportserver - download via: https://bia-rpt-acc.radboudumc.nl/reports

---

## 📋 Inhoudsopgave

- [Wat doet deze repository?](#-wat-doet-deze-repository)
- [Waarom deze setup gebruiken?](#-waarom-deze-setup-gebruiken)
- [Wat wordt er geïnstalleerd?](#-wat-wordt-er-geïnstalleerd)
- [Snelstart Gids](#-snelstart-gids)
- [Gedetailleerde Installatie](#-gedetailleerde-installatie)
- [Belangrijkste Features](#-belangrijkste-features)
- [Komorebi Window Manager](#-komorebi-window-manager)
- [PowerShell Configuratie](#-powershell-configuratie)
- [Package Managers](#-package-managers)
- [Handige Tips](#-handige-tips)
- [Troubleshooting](#-troubleshooting)
- [Aanpassen en Uitbreiden](#-aanpassen-en-uitbreiden)

---

## 🎯 Wat doet deze repository?

Deze dotfiles repository automatiseert de complete setup van een Windows 11 werkstation voor software development. Het installeert en configureert:

- ✅ **3 Package managers** (Scoop, Chocolatey, Winget) voor eenvoudig software beheer
- ✅ **Development tools** (Git, VSCode, Neovim, Node.js, Python)
- ✅ **Database tools** (SQL Server Management Studio, Azure Data Studio)
- ✅ **Terminal omgeving** (PowerShell Core met 25+ custom shortcuts)
- ✅ **Tiling window manager** (komorebi + whkd + yasb voor productiviteit)
- ✅ **Browsers** (Chrome, Firefox, Zen Browser)
- ✅ **Utilities** (7zip, Obsidian, Syncthing, PowerToys, ZoomIt)
- ✅ **Aangepaste configuraties** (Oh My Posh, Nerd Fonts, WezTerm)

**scoop** packagemanager die snel is, geen admin rechten nodig heeft.
**Chocolatey**, admin rechten nodig; die hebben we, maar vinden sommigen niet ideaal wellicht
**winget** officiele microsoft packagemanager. Meestal geen admin rechten nodig (afhankelijk van te installeren programma). Loopt soms achter met de nieuwste versies, traag

---

## 💡 Waarom deze setup gebruiken?

### Voor Nieuwe Werkstations
- **Tijdsbesparing**: Setup in 30 minuten in plaats van een hele dag
- **Consistentie**: Elke werkplek heeft dezelfde tools en configuratie
- **Geen vergeten tools**: Alles wat je nodig hebt wordt automatisch geïnstalleerd
- **Reproduceerbaar**: Identieke setup op elke machine

### Voor Bestaande Gebruikers
- **Productiviteit**: 25+ PowerShell shortcuts en window management
- **Moderne terminal**: Oh My Posh prompt met Git status, directory markers
- **Window tiling**: Automatische window plaatsing per applicatie
- **Synchronisatie**: Eenvoudig je setup delen met collega's

### Voor Radboudumc
- **Enterprise-ready**: Git configuratie voor Azure DevOps
- **Compliance**: Standaard toolset voor het team
- **Onboarding**: Nieuwe developers direct productief

---

## 📦 Wat wordt er geïnstalleerd?

### Development Stack
| Categorie | Tools |
|-----------|-------|
| **Editors/IDEs** | VSCode, Neovim (met LazyVim), Visual Studio 2022 (optioneel) |
| **Databases** | SQL Server Management Studio, Azure Data Studio |
| **Languages** | Node.js, Python 3.12.4 (optioneel), .NET SDK |
| **Version Control** | Git, TortoiseGit |
| **Compilers** | WinLibs (GCC/MinGW voor C/C++) |
| **CLI Tools** | tree-sitter-cli, claude-code, fzf, win32yank |

### Terminal & Shell
| Component | Beschrijving |
|-----------|--------------|
| **PowerShell Core** | Moderne PowerShell 7+ met cross-platform support |
| **Oh My Posh** | Customizable prompt met Git integratie en thema's |
| **WezTerm** | GPU-accelerated terminal emulator met lua config |
| **PSReadLine** | Geavanceerde command-line editing met IntelliSense |
| **Terminal-Icons** | File/folder icons in de terminal |
| **z** | Intelligente directory jumping (autojump) |

### Window Management
| Tool | Functie |
|------|---------|
| **komorebi** | Tiling window manager (automatische window layout) |
| **whkd** | Hotkey daemon voor keyboard shortcuts |
| **yasb** | Custom taskbar met systeem monitoring |

### Browsers & Utilities
| Type | Software |
|------|----------|
| **Browsers** | Google Chrome, Firefox, Zen Browser |
| **Productivity** | Obsidian (note-taking), Syncthing (file sync) |
| **Utilities** | PowerToys, ZoomIt, 7zip |

---

## 🚀 Snelstart Gids

**Minimale setup in 5 stappen (±30 minuten):**

```powershell
# 1. Sta scripts toe (als Administrator)
Set-ExecutionPolicy Unrestricted -Force

# 2. Initiele setup (Git + repository clone): start_here.ps1

## Windows 11 -> windows 10 context menu
reg add "HKCU\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /f

winget uninstall Microsoft.Git
winget install --id=Git.Git -e

##add to path
$env:PATH += ';C:\Program Files\Git\bin'

## wat is de working dir?
git clone https://radboudumc@dev.azure.com/radboudumc/Business%20Intelligence/_git/dotfiles-windows

# 3. Installeer package managers
.\install_scoop.ps1
.\install_choco.ps1

# 4. Refresh environment
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
refreshenv

# 5. Installeer alles
choco feature enable -n allowGlobalConfirmation
.\install_coreapps.ps1
.\configure_powershell.ps1
```

**Herstart je terminal** en je bent klaar! 🎉

---

## 🔧 Gedetailleerde Installatie

### Stap 1: Execution Policy Instellen

Open **PowerShell als Administrator**:

```powershell
Set-ExecutionPolicy Unrestricted -Force
```

Dit staat toe dat je .ps1 scripts kan uitvoeren.

---

### Stap 2: Initiele Setup - `start_here.ps1`

```powershell
.\start_here.ps1
```

**Dit script doet:**
- ✅ Reverted Windows 11 context menu naar Windows 10 stijl (overzichtelijker)
- ✅ Verwijdert Microsoft VFS-aware Git (conflict met standaard Git)
- ✅ Installeert standaard Git met juiste PATH configuratie
- ✅ Kloont deze repository van Azure DevOps

**Vereisten:** Administrator rechten

---

### Stap 3: Package Managers Installeren

#### A. Scoop (User-level, geen admin)

```powershell
.\install_scoop.ps1
```

**Wat is Scoop?**
- User-level package manager (installeert in je home directory)
- Geen administrator rechten nodig
- Perfect voor portable apps en CLI tools

**Gebruikt voor:** fzf, wezterm, portable apps

#### B. Chocolatey (System-level, admin vereist)

```powershell
.\install_choco.ps1
```

**Wat is Chocolatey?**
- System-wide package manager (vergelijkbaar met apt/yum op Linux)
- Grootste package repository voor Windows
- Vereist administrator rechten

**Gebruikt voor:** Meeste software (Git, VSCode, Chrome, etc.)

#### C. Environment Refresh

Na Chocolatey installatie, herlaad de environment:

```powershell
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
refreshenv
```

---

### Stap 4: Core Applicaties - `install_coreapps.ps1`

```powershell
# Enable auto-confirm (voorkomt 100+ "yes" prompts)
choco feature enable -n allowGlobalConfirmation

# Installeer alles
.\install_coreapps.ps1
```

**Installeert:**
- **Development**: Git, TortoiseGit, VSCode, Neovim, Node.js, tree-sitter-cli
- **PowerShell**: PowerShell Core, PowerToys
- **Databases**: SQL Server Management Studio
- **Browsers**: Chrome, Firefox, Zen Browser
- **Utilities**: 7zip, Obsidian, Syncthing, ZoomIt, fzf, win32yank
- **Window Manager**: komorebi, whkd, yasb
- **Terminal**: WezTerm
- **CLI Tools**: claude-code (npm global), WinLibs C compiler

**Duur:** ~15-20 minuten (afhankelijk van internet snelheid)

**Vereisten:**
- Scoop en Chocolatey geïnstalleerd
- Administrator rechten
- Stabiele internet verbinding

---

### Stap 5: Terminal Configuratie - `configure_powershell.ps1`

```powershell
.\configure_powershell.ps1
```

**Dit script doet:**

1. **Installeert Oh My Posh** (custom prompt met Git integratie)
2. **Installeert PowerShell modules:**
   - `Terminal-Icons` - Icons voor bestanden/mappen
   - `PSReadLine` - IntelliSense en command history
   - `z` - Smart directory jumping
3. **Downloadt en installeert Nerd Fonts:**
   - CascadiaCode Nerd Font (primary)
   - Hack Nerd Font (alternative)
4. **Kopieert configuraties:**
   - `Profile.ps1` → PowerShell profile directory
   - `ohmyposhv3-v2.json` → Prompt theme
   - `.wezterm.lua` → Terminal config
5. **Optioneel: LazyVim setup** (interactieve prompt)

**Na afloop:**
- ✅ Herstart je terminal
- ✅ Wijzig font naar **CaskaydiaCove NFM** of **Hack Nerd Font** in je terminal settings

---

### Stap 6: Optionele Scripts

#### Python Development - `install_python.ps1`

```powershell
.\install_python.ps1
```

**Installeert:**
- Python 3.12.4
- virtualenv
- Data science packages: numpy, pandas, fastparquet, sqlalchemy

**Voor wie:** Data scientists, Python developers

---

#### Visual Studio 2022 - `install_visualstudio.ps1`

```powershell
.\install_visualstudio.ps1
```

**Installeert:** Visual Studio 2022 Enterprise

**Extra stap:** Voor tabular model development, installeer handmatig:
- Extension: "Microsoft Analysis Services Modeling Projects"
- URL: https://marketplace.visualstudio.com/items?itemName=ProBITools.MicrosoftAnalysisServicesModelingProjects2022

**Voor wie:** C#/.NET developers, SSAS developers

---

#### Git Configuratie - `set_git_config.ps1`

```powershell
.\set_git_config.ps1
```

**Configureert Git met Radboudumc credentials:**
```powershell
git config --global user.email "howard.chingchung@radboudumc.nl"
git config --global user.name "howardcc"
```

**Pas aan:** Verander naar je eigen naam/email in het script

---

## 🌟 Belangrijkste Features

### 1. Geavanceerde PowerShell Shortcuts

De `Profile.ps1` bevat **25+ custom key bindings** voor maximale productiviteit:

#### History & Navigation
| Shortcut | Functie | Voorbeeld |
|----------|---------|-----------|
| **↑ / ↓** | Zoek backwards/forwards in history | Type `git` → ↑ toont `git commit`, `git push`, etc. |
| **F7** | Volledige command history in grid (zoekbaar) | F7 → type "docker" om alle docker commands te filteren |
| **Ctrl+R** | Reverse search in history | Ctrl+R → type keyword |

#### Directory Management
| Shortcut | Functie | Voorbeeld |
|----------|---------|-----------|
| **Ctrl+J** + `key` | Markeer huidige directory met letter | In `C:\Projects` → Ctrl+J → `p` (markeert als "p") |
| **Ctrl+j** + `key` | Spring naar gemarkeerde directory | Overal → Ctrl+j → `p` (jump naar C:\Projects) |
| **Alt+j** | Toon alle directory marks | Overzicht van alle bookmarks |

#### Smart Editing
| Shortcut | Functie | Beschrijving |
|----------|---------|--------------|
| **Alt+a** | Select command argument | Cyclet door argumenten van command |
| **Alt+'** | Toggle quotes | Cyclet tussen `arg`, `'arg'`, `"arg"` |
| **Alt+/** | Parenthesize selection | Zet haakjes om selectie |
| **"/'/(/[/{** | Smart insert | Automatisch matching closer |
| **Backspace** | Smart delete | Verwijdert matched pairs samen |

#### Development Shortcuts
| Shortcut | Functie | Equivalent |
|----------|---------|------------|
| **Ctrl+Shift+B** | Build current directory | `dotnet build` |
| **Ctrl+Shift+T** | Run tests | `dotnet test` |

#### Clipboard & Utilities
| Shortcut | Functie | Beschrijving |
|----------|---------|--------------|
| **Ctrl+V** (in edit mode) | Paste as here-string | Plakt multi-line text correct |
| **Ctrl+d, Ctrl+c** | Capture screen | Screenshot terminal output |
| **RightArrow** | Accept next word | Neemt volgende word van suggestion over |

#### Git Auto-Correction
Type `git cmt` → automatisch gecorrigeerd naar `git commit`

---

### 2. Oh My Posh Prompt

**Visual prompt met:**
- 📁 Current directory (met path shortening)
- 🌿 Git branch + status (ahead/behind, dirty/clean, stash count)
- 🎯 .NET version (if in .NET project)
- ⚡ Exit code indicator (rood bij errors)
- 👑 Admin/root indicator (geel)

**Theme:** Ashes (Base16 color scheme)

---

### 3. Window Management met Komorebi

**Tiling window manager** voor automatische window layout:

#### Layouts
- **UltrawideVerticalStack**: Optimized voor ultrawide monitors
- Automatische window placement per workspace
- Multi-monitor support (2 monitors, 7 workspaces totaal)

#### Workspace Routing (Automatisch!)
| Applicatie | Workspace | Beschrijving |
|------------|-----------|--------------|
| **Brave/Firefox/Zen** | 0 (I) | Web browsers |
| **Chrome** | 1 (II) | Chrome windows |
| **VSCode** | 3 (IV) | Code editor |
| **SSMS/Azure Data Studio** | 1 (II) | Database tools |
| **WezTerm** | 0 (I) | Terminal |
| **Outlook** | 4 (IV) | Email client |

#### Taskbar (yasb)
Custom taskbar met real-time monitoring:
- 📊 Workspaces indicator
- 🖥️ Active window title
- 💾 Storage usage
- 🧠 Memory usage
- 🌐 Network activity
- 📅 Date & time
- 🔋 Battery status

---

### 4. WezTerm Terminal

**GPU-accelerated terminal** met:
- Default: PowerShell Core (`pwsh.exe`)
- Font: CaskaydiaCove NFM (Nerd Font)
- Color scheme: AdventureTime
- Window size: 120x28 (breed voor splits)
- Lua-based configuration (`.wezterm.lua`)

---

## 🪟 Komorebi Window Manager

### Wat is Komorebi?

Een **tiling window manager** voor Windows - windows worden automatisch georganiseerd zonder overlapping, zoals op Linux (i3, bspwm) of macOS (yabai).

### Waarom gebruiken?

- ✅ **Geen handmatig window resizing meer** - alles automatisch georganiseerd
- ✅ **Maximaal schermruimte** - geen gaps of overlapping
- ✅ **Snelle window navigatie** met keyboard shortcuts
- ✅ **Workspace per taak** - browsers op workspace 0, code op workspace 3, etc.
- ✅ **Ultrawide monitor optimalisatie** - perfect voor 21:9 en 32:9 monitors

### Configuratie Bestanden

```
komorebi/
├── komorebi.json         # Main config (layouts, workspaces, shortcuts)
├── applications.json     # 100+ app-specific rules (3234 lines)
└── komorebi.bar.json     # Taskbar config (yasb)
```

### Customization

Edit `C:\Users\<USERNAME>\.config\komorebi\komorebi.json` om:
- Layouts per workspace te wijzigen
- Window rules aan te passen
- Keyboard shortcuts te customizen
- Monitor setup te configureren

**Documentatie:** https://lgug2z.github.io/komorebi/

---

## 💻 PowerShell Configuratie

### Profile.ps1 Structuur

```powershell
#Requires -Modules Terminal-Icons, PSReadLine

# 1. Chocolatey integration
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

# 2. Oh My Posh prompt
oh-my-posh init pwsh --config "$env:USERPROFILE\Documents\PowerShell\ohmyposhv3-v2.json"

# 3. Aliases
Set-Alias -Name vi -Value nvim

# 4. Command completion (winget, dotnet)

# 5. PSReadLine configuration (25+ key bindings)

# 6. Custom functions
```

### Handmatige Symlink (Optioneel)

Als je wijzigingen in de repo automatisch wilt in je profile:

```powershell
# Backup oude profile
Move-Item "$env:USERPROFILE\Documents\PowerShell\profile.ps1" "$env:USERPROFILE\Documents\PowerShell\profile.ps1.backup"

# Maak symlink
New-Item -Path "$env:USERPROFILE\Documents\PowerShell\profile.ps1" `
         -ItemType "SymbolicLink" `
         -Value "C:\workspace\dotfiles-windows\Profile.ps1"
```

**Voordeel:** Edits in `C:\workspace\dotfiles-windows\Profile.ps1` zijn direct actief in PowerShell

---

## 📦 Package Managers

### Vergelijking

| Feature | Scoop | Chocolatey | Winget |
|---------|-------|------------|--------|
| **Admin rechten** | ❌ Nee | ✅ Ja | Varies |
| **Installatie locatie** | `~/scoop/` | `C:\ProgramData\` | Varies |
| **Package count** | ~1,000+ | ~9,000+ | ~4,000+ |
| **Update command** | `scoop update *` | `choco upgrade all` | `winget upgrade --all` |
| **Best voor** | CLI tools, portable apps | Software installaties | Official Microsoft apps |

### Wanneer Welke Gebruiken?

```
Wil je CLI tool of portable app?
├─ Ja → Gebruik Scoop (geen admin nodig)
└─ Nee → Wil je system-wide install?
    ├─ Ja → Gebruik Chocolatey (grootste repository)
    └─ Nee → Check Winget (officieel Microsoft)
```

### Handige Commands

#### Scoop
```powershell
scoop search <package>    # Zoek package
scoop install <package>   # Installeer
scoop update *            # Update alles
scoop list                # Lijst geinstalleerde packages
```

#### Chocolatey
```powershell
choco search <package>    # Zoek package
choco install <package>   # Installeer
choco upgrade all         # Update alles
choco list --local        # Lijst geinstalleerde packages
```

#### Winget
```powershell
winget search <package>   # Zoek package
winget install <id>       # Installeer
winget upgrade --all      # Update alles
winget list               # Lijst geinstalleerde packages
```

### Package Repositories

- **Chocolatey**: https://community.chocolatey.org/packages
- **Scoop**: https://scoop.sh/
- **Winget**: https://winget.run/

---

## 💡 Handige Tips

### Terminal Font Instellen

Na `configure_powershell.ps1`:

**Windows Terminal:**
1. Open Settings (Ctrl+,)
2. Profiles → PowerShell → Appearance
3. Font face: **CaskaydiaCove NFM** of **Hack Nerd Font Mono**
4. Font size: 10-12

**WezTerm:**
- Already configured in `.wezterm.lua` (font = "CaskaydiaCove NFM")

### LazyVim (Neovim Setup)

Als je "Yes" koos tijdens `configure_powershell.ps1`:
- LazyVim config staat in `$env:LOCALAPPDATA\nvim\`
- Start Neovim: `nvim` → plugins installeren automatisch
- Documentatie: https://www.lazyvim.org/

### Git Credentials

Voor Azure DevOps (Radboudumc):
```powershell
.\set_git_config.ps1
```

Verander in het script naar je eigen gegevens:
```powershell
git config --global user.email "jouw.naam@radboudumc.nl"
git config --global user.name "jouwnaam"
```

### VPN Toegang

Remote werken bij Radboudumc:
https://ravpn.radboudumc.nl

---

## 🔧 Troubleshooting

### PSReadLine Module Conflict

**Probleem:** PSReadLine update faalt met "module in use"

**Oplossing:**
```cmd
powershell -noprofile -command "Install-Module PSReadLine -AllowPrerelease -Force"
```

---

### Git VFS Conflict

**Probleem:** Standaard Git installeert niet (VFS for Git conflict)

**Oplossing:**
- `start_here.ps1` verwijdert VFS for Git automatisch
- Of handmatig: Uninstall via Settings → Apps → "Git for Windows (VFS)"

---

### Winget Niet Gevonden

**Probleem:** `winget: command not found`

**Oplossing 1:** Installeer App Installer via Microsoft Store:
https://www.microsoft.com/p/app-installer/9nblggh4nns1

**Oplossing 2:** Update Windows (Winget is built-in sinds Windows 11 22H2)

---

### Chocolatey Environment Niet Geladen

**Probleem:** `choco` command werkt niet na installatie

**Oplossing:**
```powershell
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
refreshenv
```

Of: Herstart PowerShell terminal

---

### Oh My Posh Symbols Niet Zichtbaar

**Probleem:** Rare characters/boxes in plaats van icons

**Oplossing:**
- Installeer Nerd Font (gebeurt in `configure_powershell.ps1`)
- Wijzig terminal font naar **CaskaydiaCove NFM** of **Hack Nerd Font Mono**
- Herstart terminal

---

### Komorebi Start Niet

**Probleem:** komorebi.exe crashes of start niet

**Oplossing 1:** Check config syntax:
```powershell
komorebic check
```

**Oplossing 2:** View logs:
```powershell
komorebic log
```

**Oplossing 3:** Reset config:
```powershell
komorebic stop
# Fix config errors
komorebic start
```

---

### RDP Copy/Paste Werkt Niet

**Probleem:** Kan niet copy/pasten tussen local en RDP sessie

**Oplossing:**
1. Check RDP clipboard redirection (in RDP client settings)
2. Restart `rdpclip.exe` op remote machine:
   ```powershell
   taskkill /f /im rdpclip.exe
   rdpclip.exe
   ```

---

### Edge Intranet Authentication

**Probleem:** Moet herhaaldelijk inloggen voor Radboudumc intranet

**Oplossing:**
1. Edge → Settings → Privacy, search, and services
2. "Automatically switch to more secure connections" → **Off**
3. Restart Edge

---

## 🎨 Aanpassen en Uitbreiden

### Eigen Software Toevoegen

Edit `install_coreapps.ps1`:

```powershell
# Via Chocolatey (system-wide)
choco install <package-name>

# Via Scoop (user-level)
scoop install <package-name>

# Via Winget
winget install --id <package-id>
```

**Voorbeeld:** Slack toevoegen:
```powershell
choco install slack
```

---

### PowerShell Shortcuts Aanpassen

Edit `Profile.ps1` (regel ~100-600):

```powershell
Set-PSReadLineKeyHandler -Chord "<shortcut>" -Function <function>
# Of custom script:
Set-PSReadLineKeyHandler -Chord "<shortcut>" -ScriptBlock { <code> }
```

**Voorbeeld:** Voeg Ctrl+G toe voor `git status`:
```powershell
Set-PSReadLineKeyHandler -Chord "Ctrl+g" -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("git status")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
```

---

### Oh My Posh Theme Wijzigen

1. **Browse themes:** https://ohmyposh.dev/docs/themes
2. **Download theme:** Save JSON naar `$env:USERPROFILE\Documents\PowerShell\`
3. **Edit Profile.ps1:**
   ```powershell
   oh-my-posh init pwsh --config "$env:USERPROFILE\Documents\PowerShell\<new-theme>.json"
   ```

---

### Komorebi Layouts Aanpassen

Edit `C:\Users\<USERNAME>\.config\komorebi\komorebi.json`:

```json
{
  "monitors": [
    {
      "workspaces": [
        {
          "name": "I",
          "layout": "BSP"  // Verander naar: BSP, Columns, Rows, etc.
        }
      ]
    }
  ]
}
```

**Available layouts:**
- `BSP` - Binary Space Partitioning (dynamisch)
- `Columns` - Verticale kolommen
- `Rows` - Horizontale rijen
- `UltrawideVerticalStack` - Main window + stack (ultrawide)

**Documentatie:** https://lgug2z.github.io/komorebi/common-workflows/layouts.html

---

### App Workspace Routing Toevoegen

Edit `C:\Users\<USERNAME>\.config\komorebi\komorebi.json`:

```json
{
  "app_specific_configuration_path": "C:/Users/<USERNAME>/.config/komorebi/applications.json"
}
```

Then edit `applications.json`:

```json
{
  "myapp.exe": {
    "name": "My Application",
    "rules": [
      {
        "kind": {
          "targeting": {
            "workspace": {
              "monitor_index": 0,
              "workspace_index": 2
            }
          }
        }
      }
    ]
  }
}
```

Nu opent `myapp.exe` altijd op workspace 2 (monitor 0).

---

## 📚 Bronnen & Documentatie

### Official Docs
- **Komorebi**: https://lgug2z.github.io/komorebi/
- **Oh My Posh**: https://ohmyposh.dev/
- **WezTerm**: https://wezfurlong.org/wezterm/
- **PSReadLine**: https://docs.microsoft.com/en-us/powershell/module/psreadline/
- **Scoop**: https://scoop.sh/
- **Chocolatey**: https://docs.chocolatey.org/

### Community
- **Komorebi Discord**: https://discord.gg/komorebi
- **r/PowerShell**: https://reddit.com/r/PowerShell
- **r/commandline**: https://reddit.com/r/commandline

### Azure DevOps Repository
```
https://radboudumc@dev.azure.com/radboudumc/Business%20Intelligence/_git/dotfiles-windows
```

---

## 📄 Licentie & Credits

**Created by:** Howard Ching Chung (Radboudumc)
**Organization:** Radboudumc Business Intelligence Team
**Repository:** Azure DevOps (Radboudumc)

---

## 🤝 Contributing

Verbeteringen of aanvullingen?

1. Clone repository
2. Maak wijzigingen in een branch
3. Test op een fresh Windows 11 install (VM aanbevolen)
4. Submit pull request met beschrijving

**Let op:** Test altijd scripts voordat je commit - deze repository wordt gebruikt voor production setups!

---

**Veel plezier met je nieuwe setup! 🚀**

*Voor vragen of problemen, open een issue in Azure DevOps of neem contact op met het BI team.*
