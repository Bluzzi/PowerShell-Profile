enum PelicoWebsite {
  App
  Ibis
  Flamingo
}

function Open-Pelico {
  param (
    [Parameter(Mandatory = $True)]
    [PelicoWebsite] $Target
  )

  switch ($Target) {
    ([PelicoWebsite]::App) {
      $URL = "$env:PELICO_URL/ui"
    }

    ([PelicoWebsite]::Ibis) {
      $URL = "$env:PELICO_URL/ibis/api/playground"
    }

    ([PelicoWebsite]::Flamingo) {
      $URL = "$env:PELICO_URL/flamingo/api/graphql"
    }

    Default {
      Write-Host "Website does not exist."
      return
    }
  }

  Start-Process $URL
}

