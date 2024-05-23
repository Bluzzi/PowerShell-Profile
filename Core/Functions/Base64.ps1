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

function Convert-ToBase64File {
    param (
        [Parameter(Mandatory=$true)]
        [string]$InputFilePath,

        [Parameter(Mandatory=$true)]
        [string]$OutputFilePath
    )

    # Vérifier si le fichier d'entrée existe
    if (-Not (Test-Path $InputFilePath)) {
        Write-Error "Le fichier spécifié n'existe pas : $InputFilePath"
        return
    }

    try {
        # Lire le contenu du fichier d'entrée
        $content = Get-Content -Path $InputFilePath -Raw
        
        # Encoder le contenu en Base64
        $encodedContent = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($content))
        
        # Écrire le contenu encodé dans le fichier de sortie
        Set-Content -Path $OutputFilePath -Value $encodedContent
        Write-Host "Le fichier a été encodé et sauvegardé : $OutputFilePath"
    }
    catch {
        Write-Error "Une erreur s'est produite lors de l'encodage ou de l'écriture du fichier : $_"
    }
}