<#
  .SYNOPSIS
  Display the first commit of the current git branch.
#>
function Get-First-Commit {
  $MainBranch = (git remote show origin | Select-String "HEAD branch" | ForEach-Object { $_ -replace "HEAD branch: ", "" }).Trim()
  $CurrentBranch = git branch --show-current

  $BranchsDiff = "$MainBranch..$CurrentBranch"

  $FirstCommitHash = git log --oneline --reverse $BranchsDiff | ForEach-Object { $_.Split(" ")[0] } | Select-Object -First 1 

  return $FirstCommitHash
}