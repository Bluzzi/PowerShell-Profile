<#
.DESCRIPTION
Parse environment variable in the prompt.
#>
function we {
  $re = '^(?:(?<name>\b.+?)\s*=\s*(?<value>.+?)\s+)*(?<cmd>.+)$'
  $m = [Text.RegularExpressions.Regex]::Match($args, $re)

  if (-not $m.Success) {
    Write-Error "Bad entry. Couldn't extract the command, the arguments or the environment variables!" -ErrorAction Stop
  }

  $envNames = $m.Groups['name'].Captures
  $envValues = $m.Groups['value'].Captures

  $mEnvVars = @{}
  $nEnvVars = @()

  for ($i = 0; $i -lt $envNames.Count; ++$i) {
    $envName = $envNames[$i].Value
    if (Test-Path env:\$envName) {
      $envVar = Get-Item env:\$envName
      $mEnvVars.Add($envName, $envVar.Value)
    }
    else {
      $nEnvVars += $envName
    }
  }

  $cmd = $m.Groups['cmd'].Value

  try {
    for ($i = 0; $i -lt $envNames.Count; ++$i) {
      Write-Verbose "we: set environnent variable $($envNames[$i].Value)=$($envValues[$i].Value)"
      Set-Item -Path env:\$($envNames[$i].Value) $envValues[$i].Value
    }

    Write-Verbose "we: Invoke expression '$cmd'"

    Invoke-Expression $cmd
  }
  finally {
    foreach ($envVar in $mEnvVars.Keys) {
      Set-Item env:\$envVar $mEnvVars.$envVar
    }

    foreach ($envVar in $nEnvVars) {
      Remove-Item env:\$envVar
    }
  }
}