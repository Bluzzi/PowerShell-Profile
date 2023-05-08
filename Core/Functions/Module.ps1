function Save-Module([string] $moduleName) {
  if (Get-Module -ListAvailable -Name $moduleName) {
    Import-Module $moduleName
  } else {
    Install-Module $moduleName
    Import-Module $moduleName
  }
}