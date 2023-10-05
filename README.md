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