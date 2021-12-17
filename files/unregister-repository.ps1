#!/usr/bin/env pwsh

param (
    [Parameter(Mandatory=$true)]
    [string]$name
)

$ErrorActionPreference = 'stop'

# Check if the repository is present
$repository_present = Get-PSRepository | Where-Object {$_.name -eq "$name"}

# Testing module version
if ($repository_present) {
  Write-Output "Repository '$name' found"
}
else {
  Write-Output "Repository '$name' not found"
  exit 0
}

# Register repository
try {
  Unregister-PSRepository -Name $name
  exit 1
}
catch {
  Write-Output "Failed to unregister repository '$name'"
  exit 2
}
