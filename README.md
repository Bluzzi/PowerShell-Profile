# PowerShell-Profile
My PowerShell configuration for an efficient CLI. Compatible with any operating system.

## Installation
### Required programs
- [PowerShell](https://github.com/PowerShell/PowerShell)
- [Zoxide](https://github.com/ajeetdsouza/zoxide) for file navigation with the `z` command

### Clone the profile
- open the previously installed PowerShell
- `mkdir $PROFILE/..`: create the folder that will contain this PowerShell profile
- `cd $PROFILE/..`: move to the folder you just created  
- `git clone https://github.com/Bluzzi/PowerShell-Profile.git .`: clone this repo in the current directory
- reload your PowerShell

Everything should work! 🎉

## Features
- [Zoxide](https://github.com/ajeetdsouza/zoxide): efficient file navigation
- [Posh-Git](https://github.com/dahlbyk/posh-git): git support
- Auto-completion
- Base64 encode/decode functions (`btoa`, `atob`)
- Command line environment variable for every OS `we PORT=3000 pnpm run dev`
- Git utils (`get-branchs`, `get-commits`)
- NPM & PNPM support
- Load the `.env` (next to `$PROFILE`)

## Unit tests
[Pester](https://pester.dev/) is used for unit testing. Here are the commands for running the tests.
- `Install-Module -Name Pester -Force -AllowClobber`
- `Invoke-Pester` or `Invoke-Pester -Path $PROFILE/..`

## To Do
- https://openclassrooms.com/fr/courses/7938616-planifiez-vos-taches-avec-des-scripts-powershell-sur-windows-server/8091884-tirez-un-maximum-de-ce-cours
- https://pester.dev/
- https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.3
- https://learn.microsoft.com/fr-fr/powershell/scripting/developer/cmdlet/validating-parameter-input?view=powershell-7.3
- https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/parameter-aliases?view=powershell-7.3
- https://riptutorial.com/powershell/example/29958/parameter-validation 
- https://learn.microsoft.com/fr-fr/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7.3