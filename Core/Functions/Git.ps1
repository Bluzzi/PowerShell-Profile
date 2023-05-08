function Get-Commits {
  param(
    [switch] $WithCommiterName
  )

  if ($WithCommiterName) {
    $commiterName = '%Cred%cd%<(18) %Cblue%cn'
  }

  git log --pretty=format:"%C(yellow)%h %Cred%ad%<(18) %Cblue%an $commiterName|%Cgreen%d %Creset%s" --date=iso @args
}


function Get-Branchs {
  param(
    [switch] $Remote,
    [switch] $WithCommiter,
    [switch] $WithUpstreamStatus
  )

  $branches = $Remote ? (git branch -r) : (git branch)

  if ($Remote) {
    $branches = git branch -r `
      | ForEach-Object { $branch = $_ -replace '^(\s|\*)*'; $branch } `
      | Where-Object { $_ -inotmatch 'HEAD' }
  }
  else {
    $localBranches = git branch -vv `
      | ForEach-Object { ([regex] '^(?:\s|\*)*(?<Branch>.+?)\s+.+?\s(?:\[(?<Upstream>.+?)(?::\s(?<Status>.+?))?\]\s)?(?<Message>.+)').match($_) } `
      | ForEach-Object { $_.Groups | Select-Object -Skip 1 | ForEach-Object -Begin { $o = @{} } -Process { $o.Add($_.Name, $_.Value) } -End { [PSCustomObject] $o } }
    
      $branches = $localBranches.branch
  }

  $branches `
   | ForEach-Object { 
      $branch = $_
      git show -s --pretty=format:"%ai|%an|%ci|%cr|%cn|%s" $branch `
        | Select-Object -First 1 `
          | ForEach-Object { 
              $o = $_ -split '\|' 
              $r = [PSCustomObject] @{ 
                      AuthorDate=(Get-Date $o[0])
                      Author=$o[1]
                      CommitDate=(Get-Date $o[2])
                      LastModification=$o[3]
                      Branch=$branch
                      Message=$o[5] 
                    }
              if ($WithCommiter) {
                Add-Member -InputObject $r -MemberType NoteProperty -Name Commiter -Value ($o[1] -ne $o[4] ? $o[4] : $null)
              } 
              if ($localBranches -and $WithUpstreamStatus) {
                $up = $localBranches | Where-Object Branch -EQ $branch
                Add-Member -InputObject $r -MemberType NoteProperty -Name Upstream -Value (-not $up.Upstream ? 'none' : -not $up.Status ? $up.Upstream -replace '/.*' : $up.Status) 
              }   
              $r      
            } 
      } `
        | Sort-Object CommitDate -Descending
          | Select-Object -ExcludeProperty CommitDate
}