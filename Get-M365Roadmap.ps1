$Result = Invoke-RestMethod -Uri "https://roadmap-api.azurewebsites.net/api/features"

foreach ($item in $Result) {
    Write-Host $item
}