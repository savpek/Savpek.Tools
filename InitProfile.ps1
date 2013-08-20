﻿$root = Split-Path -parent $PSCommandPath

. $root\IseTheme.ps1

$env:PSModulePath += ";$root\modules\"

Import-Module PsGet
Import-Module Custom
Import-Module Posh-Git

$customPaths = New-Object PSObject
$customPaths | Add-Member -type NoteProperty -Name Root -Value $root

foreach($moduleFolder in (Get-ChildItem -Directory "$root\modules\")) 
{
    $customPaths | Add-Member -type NoteProperty -Name $moduleFolder.Name -Value $moduleFolder
}

$env:path += ";$root\bin\Notepad2"
$env:GIT_EDITOR = "Notepad2.exe"
