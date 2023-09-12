Clear

# Demandez à l'utilisateur de saisir une adresse IP
$adresseIP = Read-Host "Veuillez entrer une adresse IP :"

# Vérifiez si l'adresse IP est valide
if ([System.Net.IPAddress]::TryParse($adresseIP, [ref]$null)) {
    # Effectuez un ping vers l'adresse IP pour vérifier si le périphérique est accessible
    if (Test-Connection -ComputerName $adresseIP -Count 1 -Quiet) {
        # Récupérez l'adresse MAC en utilisant Get-NetNeighbor
        $macAddress = (Get-NetNeighbor -IPAddress $adresseIP).LinkLayerAddress
        Write-Host "Adresse MAC du périphérique ($adresseIP) : $macAddress"
    } else {
        Write-Host "Le ping vers $adresseIP a échoué. Le périphérique n'est pas accessible."
    }
} else {
    Write-Host "Adresse IP invalide. Veuillez entrer une adresse IP valide."
}
