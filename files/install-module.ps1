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

  if ($version_installed -gt $version) {
    Write-Output "Module installed, version > required"
    exit 0
  }
  elseif ($version_installed -eq $version) {
    Write-Output "Module installed, version == required"
    exit 0
  }
  else {
    Write-Output "Module installed, version < required"
    $Mode = 'update'
  }
}
else {
  Write-Output "Module not installed"
  $Mode = 'install'
}

# Installing module
try {
  if ($mode -eq 'install') {
    Write-Output "Installing module '$name' with version '$version'"
  }
  else {
    Write-Output "Updating module '$name' with version '$version'"
  }

  $ProgressPreference = 'SilentlyContinue'
  Install-Module -Name $name -RequiredVersion $version -Scope $scope -Force -Verbose
  exit 1
}
catch {
  Write-Output "Failed to install module '$name' with version '$version'"
  exit 2
}
