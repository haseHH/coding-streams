#!/usr/bin/env pwsh
#Requires -Version 7

[CmdletBinding()]
param (
  # Path to input
  [Parameter()]
  [string]$InputPath = './example.txt'
)

$inputArray = Get-Content -Path $InputPath
$totalWrappingPaperAmount = 0

foreach ($present in $inputArray) {
  [int]$l = $present.Split('x')[0]
  [int]$w = $present.Split('x')[1]
  [int]$h = $present.Split('x')[2]

  $left = $l * $h
  $top = $w * $l
  $front = $h * $w

  $smallestSide = @($left, $top, $front) |
  Measure-Object -Minimum |
  Select-Object -ExpandProperty 'Minimum'

  $wrappingPaperAmount = (2 * $left) + (2 * $top) + (2 * $front) + $smallestSide

  $totalWrappingPaperAmount += $wrappingPaperAmount
  #Write-Host "${wrappingPaperAmount}"
}

return $totalWrappingPaperAmount
