# Windows 11 -> windows 10 context menu, run as admin

reg add "HKCU\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /f


#the vfs for git-aware flavor of git for windows is currently installed. Switching away from that flavor might break your Scalar/VFS for Git enlistments.
winget uninstall Microsoft.Git
winget install --id=Git.Git -e

#add to path
$env:PATH += ';C:\Program Files\Git\bin'

# vanuit welke working dir?
git clone https://radboudumc@dev.azure.com/radboudumc/Business%20Intelligence/_git/dotfiles-windows



