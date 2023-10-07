Import-Module Pester

Describe "Get-AbsolutePath" {
  BeforeAll {
    . "$PSScriptRoot\Get-AbsolutePath.Cmd.ps1"
  }
  
  Context "Valid Path" {
    It "Should return the absolute path without a trailing backslash" {
      Get-AbsolutePath -Path "$env:TEMP\" | Should -Not -Match ([regex]::Escape("(/|\)$"))
      Get-AbsolutePath -Path "$env:TEMP/" | Should -Not -Match ([regex]::Escape("(/|\)$"))
    }
  }
  
  Context "Invalid Path" {
    It "Should throw an error for an invalid path" {
      { Get-AbsolutePath -Path "/non-existent-folder" } | Should -Throw
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
