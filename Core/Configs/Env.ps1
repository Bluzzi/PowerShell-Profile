$profileDirectory = [System.IO.Path]::GetDirectoryName($PROFILE)
$envFilePath = Join-Path -Path $profileDirectory -ChildPath ".env"

if (Test-Path $envFilePath) {
  Get-Content $envFilePath | foreach {
    $name, $value = $_.split('=')

    if ([string]::IsNullOrWhiteSpace($name) || $name.Contains('#')) {
      continue
    }

    Set-Item -Path "env:$name" -Value $value
  }
}