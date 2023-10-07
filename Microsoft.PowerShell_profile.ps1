# Auto-load commands:
$CommandsPath = "$PSScriptRoot\Core\Commands"

foreach ($FolderPath in Get-ChildItem -Path $CommandsPath -Directory) {
  $FolderName = Split-Path -Path $FolderPath -Leaf

  if (!(Test-Path -Path "$FolderPath\$FolderName.Cmd.ps1" -PathType Leaf)) { return }

  . "$FolderPath\$FolderName.Cmd.ps1"
}

foreach ($FilePath in Get-ChildItem -Path "$PSScriptRoot\Core\Functions" -File) {
  . $FilePath
}

# Auto-load extensions:
foreach ($FilePath in Get-ChildItem -Path "$PSScriptRoot\Core\Extensions" -File) {
  . $FilePath
}

# Auto-load configs:
foreach ($FilePath in Get-ChildItem -Path "$PSScriptRoot\Core\Configs" -File) {
  . $FilePath
}