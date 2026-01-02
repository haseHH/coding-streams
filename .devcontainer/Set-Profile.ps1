#!/usr/bin/env pwsh
#Requires -Version 7

# install modules
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module -Name 'posh-git'

# prepare profile script
$profilePath = '/home/vscode/.config/powershell'
New-Item -ItemType Directory -Path $profilePath | Out-Null
Out-File -FilePath "${profilePath}/profile.ps1" `
  -InputObject "Import-Module -Name 'posh-git'"

# link profile in contexts
New-Item -ItemType SymbolicLink -Target "${profilePath}/profile.ps1" `
  -Path "${profilePath}/Microsoft.PowerShell_profile.ps1" | Out-Null
New-Item -ItemType SymbolicLink -Target "${profilePath}/profile.ps1" `
  -Path "${profilePath}/Microsoft.VSCode_profile.ps1" | Out-Null
