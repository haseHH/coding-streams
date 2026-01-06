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
  $xSanta = 0
  $ySanta = 0
  [System.Collections.ArrayList]$coordinatesSanta = @('0,0')
  $xRoboSanta = 0
  $yRoboSanta = 0
  [System.Collections.ArrayList]$coordinatesRoboSanta = @('0,0')

  $directionIsForSanta = $true

  foreach ($direction in [char[]]$route) {
    if ($directionIsForSanta) {
      switch ($direction) {
        '^' { $xSanta++ }
        '<' { $ySanta-- }
        '>' { $ySanta++ }
        'v' { $xSanta-- }
      }
      $coordinatesSanta.Add("${xSanta},${ySanta}") | Out-Null

      $directionIsForSanta = $false
    }
    else {
      switch ($direction) {
        '^' { $xRoboSanta++ }
        '<' { $yRoboSanta-- }
        '>' { $yRoboSanta++ }
        'v' { $xRoboSanta-- }
      }
      $coordinatesRoboSanta.Add("${xRoboSanta},${yRoboSanta}") | Out-Null

      $directionIsForSanta = $true
    }
  }

  Write-Host ($coordinatesSanta + $coordinatesRoboSanta | Sort-Object -Unique).Count
}
