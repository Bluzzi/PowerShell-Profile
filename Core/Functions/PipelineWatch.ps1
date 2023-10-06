function pw([string] $branch) {
  $branchName = ($branch) ? "$branch" : (git rev-parse --abbrev-ref HEAD)

  we NODE_OPTIONS=--no-warnings pipeline-watch -p meta -b $branchName
}