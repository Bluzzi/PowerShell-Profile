<#
  .SYNOPSIS
  Converts a path to its absolute representation without a trailing backslash.
#>
function Get-AbsolutePath {
  param(
    [Parameter(Mandatory = $true)]
    [ValidateScript({
      if (Test-Path -Path $_ -PathType Container) {
        $true
      } else {
        throw "The specified path '$_' does not exist."
      }
    })]
    [string] $Path
  )

  try {
    $AbsolutePath = Convert-Path $Path

    if ($AbsolutePath.EndsWith("\")) {
      $AbsolutePath = $AbsolutePath.TrimEnd("\")
    }

    return $AbsolutePath
  } catch {
    Write-Error "An error occurred while converting the path: $_"
  }
}