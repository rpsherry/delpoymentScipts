<#
7zip 1604 -x64 Windows Deployment Script

Author:         Ryan Sherry
Date Created:   7/27/2017
Company:        Reverus
#>

$User = $env:UserName


#check to Make sure user is admin powershell if not elevate

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

Write-Host "Starting 7Zip"
Write-Host "User:" $User


#download from the website
Write-Host "Down Loading file"
(New-Object System.Net.WebClient).DownloadFile("http://www.7-zip.org/a/7z1604-x64.msi", "$env:C:\temp\7z1604-x64.msi")


#change to where the file was downloaded
cd C:\TEMP

 #install the file silently

msiexec.exe /i "C:\temp\7z1604-x64.msi" /qb

Write-Host "7zip installed"
