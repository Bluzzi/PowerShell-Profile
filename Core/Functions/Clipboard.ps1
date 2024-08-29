# Function to copy text to the clipboard
function Copy-ToClipboard {
  param (
    [Parameter(ValueFromPipeline=$true)]
    [string]$text
  )

  begin {
    $sb = [System.Text.StringBuilder]::new()
  }

  process {
    $sb.AppendLine($text) | Out-Null
  }

  end {
    if ($PSVersionTable.PSVersion.Major -lt 5) {
      Write-Error "Your version of PowerShell does not support Set-Clipboard."
      return
    }

    Set-Clipboard -Value $sb.ToString()
    Write-Host "The content has been copied to the clipboard."
  }
}