Install-Module -Name Microsoft.Graph.Teams
Install-Module -Name Microsoft.Graph.CloudCommunications

Import-Module Microsoft.Graph.Teams
Import-Module Microsoft.Graph.CloudCommunications

Connect-MgGraph -TenantId "TenantID" -ClientId "ClientID" -CertificateThumbprint "ThumbprintID"
# Connect-MgGraph -Scopes "CallRecords.Read.All"

$callRecordId = "CallRecordID"
$myCall = Get-MgCommunicationCallRecordSession -CallRecordId $callRecordId