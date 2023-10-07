Import-Module Pester

Describe "Get-AbsolutePath" {
  BeforeAll {
    . "$PSScriptRoot\Get-AbsolutePath.Cmd.ps1"
    
    $env:ValidPath = "$env:TEMP\"
    $env:InvalidPath = "/non-existent-folder"
  }
  
  Context "Valid Path" {
    It "Should return the absolute path without a trailing backslash" {
      Get-AbsolutePath -Path $env:ValidPath | Should -Not -Match "(\/|\\)$"
    }
  }
  
  Context "Invalid Path" {
    It "Should throw an error for an invalid path" {
      { Get-AbsolutePath -Path $env:InvalidPath } | Should -Throw
    }
  }
  
  Context "Empty Path" {
    It "Should throw an error for an empty path" {
      { Get-AbsolutePath -Path "" } | Should -Throw
    }
  }
  
  Context "Null Path" {
    It "Should throw an error for a null path" {
      { Get-AbsolutePath -Path $null } | Should -Throw
    }
  }
}
