$currentBranch = git rev-parse --abbrev-ref HEAD

function pw([string] $branch) {
  $branchName = ($branch) ? "$branch" : "$currentBranch"

  we NODE_OPTIONS=--no-warnings pipeline-watch -p meta -b $branchName
}