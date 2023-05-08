$moduleName = "posh-git"
Save-Module $moduleName

$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::DarkGray
$GitPromptSettings.BeforeStatus.Text = "["

$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::DarkGray
$GitPromptSettings.AfterStatus.Text = "]"

$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Green

function prompt {
  $gitStatus = Get-GitStatus
  $path = (Get-Location).Path 
  $arrow = Write-Prompt " > " -ForegroundColor ([ConsoleColor]::White)

  # Not in a repository:
  if (-not $gitStatus) {
    return "$($path)$($arrow)"
  }

  # In a repository:
  $repoRelativePath = Write-Prompt ($path -replace ".*?($($gitStatus.RepoName).*)", '$1') -ForegroundColor ([ConsoleColor]::White)
  
  return "$($repoRelativePath)$(Write-VcsStatus)$($arrow)"
}