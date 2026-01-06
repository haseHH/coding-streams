#!/usr/bin/env pwsh
#Requires -Version 7

[CmdletBinding()]
param (
  # Path to input
  [Parameter()]
  [string]$InputPath = './example.txt'
)

$inputArray = Get-Content -Path $InputPath
$totalRibbonAmount = 0

foreach ($present in $inputArray) {
  [int]$l = $present.Split('x')[0]
  [int]$w = $present.Split('x')[1]
  [int]$h = $present.Split('x')[2]

  # perimeter instead of sqare units
  $left = (2 * $l) + (2 * $h)
  $top = (2 * $w) + (2 * $l)
  $front = (2 * $h) + (2 * $w)

  $smallestSidePerimeter = @($left, $top, $front) |
  Measure-Object -Minimum |
  Select-Object -ExpandProperty 'Minimum'

  $volume = $l * $w * $h

  $ribbonAmount = $smallestSidePerimeter + $volume
  $totalRibbonAmount += $ribbonAmount
}

return $totalRibbonAmount
