#!/usr/bin/env pwsh

param (
    [Parameter(Mandatory=$true)]
    [string]$name,
    [Parameter(Mandatory=$true)]
    [string]$SourceLocation,
    [Parameter(Mandatory=$true)]
    [string]$PublishLocation,
    [Parameter(Mandatory=$true)]
    [string]$InstallationPolicy,
    [string]$mode = 'register',
    [string]$scope = 'AllUsers'
)

$ErrorActionPreference = 'stop'

# Check if the repository is present
$repository_present = Get-PSRepository | Where-Object {$_.name -eq "$name"}


# Testing module version
if ($repository_present) {
  Write-Output "Repository '$name' found"
  exit 0
}
else {
  Write-Output "Repository '$name' not found"
}

# Register repository
try {
  Register-PSRepository -Name $name -SourceLocation $SourceLocation -PublishLocation $PublishLocation -InstallationPolicy $InstallationPolicy
  exit 1
}
catch {
  Write-Output "Failed to register repository '$name'"
  exit 2
}
