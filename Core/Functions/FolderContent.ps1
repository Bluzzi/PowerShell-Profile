# Function to read the content of all text files in a directory and its subdirectories, or a single file
function Get-AllTextContent {
  param (
    [string]$path
  )

  # Resolve the full path
  $fullPath = Resolve-Path -Path $path -ErrorAction SilentlyContinue

  if (-Not $fullPath) {
    Write-Error "The specified path does not exist."
    return
  }

  # Initialize a variable to store all the content
  $allTextContent = ""

  if (Test-Path -Path $fullPath -PathType Container) {
    # If the path is a directory, get all files recursively
    $files = Get-ChildItem -Path $fullPath -Recurse -File

    foreach ($file in $files) {
      try {
        # Read the content of the file
        $fileContent = Get-Content -Path $file.FullName -ErrorAction Stop
        # Append the file content to the variable
        $allTextContent += $fileContent + "`r`n"
      } catch {
        Write-Host "Error reading file: $($file.FullName)"
      }
    }
  } elseif (Test-Path -Path $fullPath -PathType Leaf) {
    try {
      # Read the content of the single file
      $allTextContent = Get-Content -Path $fullPath -ErrorAction Stop
    } catch {
      Write-Host "Error reading file: $path"
    }
  } else {
    Write-Error "The specified path is neither a file nor a directory."
    return
  }

  return $allTextContent
}