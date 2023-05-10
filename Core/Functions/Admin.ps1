function sudo {
  param (
    [Parameter(Position = 0, Mandatory = $true, ValueFromRemainingArguments = $true)]
    [String]$Command
  )
  
  $script = $Command

  Start-Process -FilePath pwsh -ArgumentList "-Command $script" -Verb RunAs
}