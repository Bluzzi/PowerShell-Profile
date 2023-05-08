<#
.DESCRIPTION
Converts a path to its absolute representation without a trailing backslash.
#>
function path([string] $path) { 
  (Convert-Path $path) -replace '\\$'
}

<#
.DESCRIPTION
Open the path in your explorer.
#>
function x([string] $path) { 
  explorer (path $args)
}