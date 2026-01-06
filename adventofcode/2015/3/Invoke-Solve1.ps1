#!/usr/bin/env pwsh
#Requires -Version 7

[CmdletBinding()]
param (
  # Path to input
  [Parameter()]
  [string]$InputPath = './example.txt'
)

$inputArray = Get-Content -Path $InputPath

foreach ($route in $inputArray) {
  $x = 0
  $y = 0
  [System.Collections.ArrayList]$coordinates = @('0,0')

  foreach ($direction in [char[]]$route) {
    switch ($direction) {
      '^' { $x++ }
      '<' { $y-- }
      '>' { $y++ }
      'v' { $x-- }
    }
    $coordinates.Add("${x},${y}") | Out-Null
  }

  Write-Host ($coordinates | Sort-Object -Unique).Count
}
