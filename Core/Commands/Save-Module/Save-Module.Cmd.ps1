<#
  .SYNOPSIS
  Install and import the module if it is not installed, or import it directly if it is already installed.
#>
function Save-Module {
  param (
    [Parameter(Mandatory = $True)]
    [string] $ModuleName
  )

  if (Get-Module -ListAvailable -Name $moduleName) {
    Import-Module -Name $moduleName
  } else {
    Install-Module -Name $moduleName -Force
    Import-Module -Name $moduleName
  }
}