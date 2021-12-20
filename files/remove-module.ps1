#!/usr/bin/env pwsh

param (
    [Parameter(Mandatory=$true)]
    [string]$name,

    [Parameter(Mandatory=$true)]
    [version]$version,

    [string]$scope = 'AllUsers'
)

# Set default action preference
$ErrorActionPreference = 'stop'

# Check if the module is installed
[version]$version_installed = (Get-InstalledModule -Name $name -ErrorAction:SilentlyContinue).Version

# Testing module version
if ($version_installed) {

  Write-Output "Module installed"
}
else {
  Write-Output "Module not installed"
  exit 0
}

# Removing module
try {
  Write-Output "Removing module '$name'"

  $ProgressPreference = 'SilentlyContinue'
  Remove-Module -Name $name -Scope $scope -Force -Verbose
  exit 1
}
catch {
  Write-Output "Failed to remove module '$name'"
  exit 2
}
