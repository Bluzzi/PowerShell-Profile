<#
.DESCRIPTION
Encode string to base64
#>
function btoa { 
  $string = $args -join " "

  [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($string))
}

<#
.DESCRIPTION
Decode base64 to string.
#>
function atob { 
  $string = $args -join " "

  [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($string))
}
