Import-Module posh-git

$GitPromptSettings.BeforeStatus.Text = '[ '
$GitPromptSettings.AfterStatus.Text = ' ]'

function prompt {
  $s = Get-GitStatus

  if (-not $s) {
    "$((Get-Location).Path)$(if ($nestedpromptlevel -ge 1) { ' >>' }) ❯ "
  } else {
    "$($PWD -replace ".*?($($s.RepoName).*)", '$1')$(Write-VcsStatus) ❯ "
  }
}