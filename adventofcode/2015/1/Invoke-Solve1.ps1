#!/usr/bin/env pwsh
#Requires -Version 7

[CmdletBinding()]
param (
  # Path to input
  [Parameter()]
  [string]$InputPath = './example.txt'
)

$inputText = Get-Content -Path $InputPath

$floor = 0

foreach ($floorChange in [char[]]$inputText) {
  if ($floorChange -eq '(') {
    $floor++
  }
  else {
    $floor--
  }
}

return $floor
