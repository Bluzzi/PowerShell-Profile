function Get-Stats {
  param(
    [int]$Top = 10
  )

  $gitLogOutput = git log --numstat --pretty=format:

  $stats = $gitLogOutput | ForEach-Object {
    if ($_ -match '^(?<additions>\d+)\s+(?<deletions>\d+)\s+(?<filename>.+)$') {
      [PSCustomObject]@{
          Filename = $Matches['filename']
          Additions = [int]$Matches['additions']
          Deletions = [int]$Matches['deletions']
      }
    }
  }

  $groupedStats = $stats | Group-Object Filename | ForEach-Object {
    [PSCustomObject]@{
      Filename = $_.Name
      TotalAdditions = ($_.Group | Measure-Object -Property Additions -Sum).Sum
      TotalDeletions = ($_.Group | Measure-Object -Property Deletions -Sum).Sum
    }
  }

  $sortedStats = $groupedStats | Sort-Object TotalAdditions, TotalDeletions -Descending

  $sortedStats | Select-Object -First $Top
}
