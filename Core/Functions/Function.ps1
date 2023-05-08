<#
.SYNOPSIS
Retrieves the definition of a PowerShell function.

.DESCRIPTION
The "Get-Func-Definition" function is used to retrieve the definition of a specified PowerShell function. 
The function takes the name of the function as a string input and returns the definition of the function as a string output.

.PARAMETER args
The name of the PowerShell function for which to retrieve the definition.

.EXAMPLE
PS C:> Get-Func-Definition Clear
Clear-Host

.NOTES
The function uses the "Get-Command" command to retrieve the function object corresponding to the specified name, 
and then uses the ".Definition" property to retrieve the definition of the function as a string. 
The function is useful for examining the definition of a PowerShell function for debugging or modification purposes.
#>
function Get-Func-Definition { 
  get-command $args -ErrorAction:SilentlyContinue | ForEach-Object { $_.Definition }
}

<#
.SYNOPSIS
Retrieves the file path containing the definition of a PowerShell function.

.DESCRIPTION
The "Get-Func-File" function is used to retrieve the file path of the PowerShell file in which a specified function is defined. 
The function takes the name of the function as a string input and returns the full file path of the PowerShell file containing the function definition.

.PARAMETER function
The name of the PowerShell function for which to retrieve the file path.

.EXAMPLE
PS C:> Get-Func-File "Get-Process"
C:\Windows\System32\WindowsPowerShell\v1.0\Modules\Microsoft.PowerShell.Management\Microsoft.PowerShell.Management.psm1

.EXAMPLE
PS C:> Get-Func-File "MyFunction"
C:\Users\username\Documents\PowerShell\MyScript.ps1

.NOTES
The function uses the "Get-ChildItem" command to retrieve the function object corresponding to the specified name, 
and then uses the ".ScriptBlock.file" method to retrieve the file path of the PowerShell file containing the function definition. 
The function is useful for maintaining or modifying complex PowerShell scripts.
#>
function Get-Func-File([string] $function) { 
  (Get-ChildItem function:$function).ScriptBlock.file
}