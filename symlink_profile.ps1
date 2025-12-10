
#as item for symlinks
$profile =    $(Get-location).path + '\Profile.ps1'

$posh =    $(Get-location).path + '\ohmyposhv3-v2.json'

#make dir
$docs = [Environment]::GetFolderPath("MyDocuments") 
$pp = $docs + '\Powershell'

if (!(test-path $pp)){
    
    write-host 'dir not found, making'
    mkdir $pp
}


New-Item -Path "$env:USERPROFILE\Documents\PowerShell\profile.ps1" `
         -ItemType "SymbolicLink" `
         -Value $profile
         
New-Item -Path "$env:USERPROFILE\Documents\PowerShell\ohmyposhv3-v2.json" `
         -ItemType "SymbolicLink" `
         -Value $posh
