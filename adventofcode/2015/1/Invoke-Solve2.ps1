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

for ($i = 0; $i -lt $inputText.Length; $i++) {
  if ($inputText[$i] -eq '(') {
    $floor++
  }
  else {
    $floor--
  }

  if ($floor -lt 0) {
    return ($i + 1)
  }
}
