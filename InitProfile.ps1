﻿$root = Split-Path -parent $PSCommandPath

. $root\IseTheme.ps1

$env:PSModulePath += ";$root\modules\"

Import-Module Custom
Import-Module CSharp

$customPaths = New-Object PSObject
$customPaths | Add-Member -type NoteProperty -Name Root -Value $root

foreach($moduleFolder in (Get-ChildItem -Directory "$root\modules\")) 
{
    $customPaths | Add-Member -type NoteProperty -Name $moduleFolder.Name -Value $moduleFolder.FullName
}

git config --global user.email "savolainen.pekka@gmail.com"
git config --global user.name "Savpek"
git config --global core.autocrlf true
$env:GIT_EDITOR = "notepad"
