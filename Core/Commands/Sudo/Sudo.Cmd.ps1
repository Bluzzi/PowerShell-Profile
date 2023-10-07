<#
  .SYNOPSIS
  Run a powershell command as administrator.
#>
function Sudo {
  param (
    [Parameter(Position = 0, Mandatory = $True, ValueFromRemainingArguments = $True)]
    [string] $Command
  )

  Start-Process -FilePath pwsh -ArgumentList "-Command $Command" -Verb RunAs
}