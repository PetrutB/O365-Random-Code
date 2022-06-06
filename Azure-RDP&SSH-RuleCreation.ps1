Login-AzAccount
Set-AzContext -SubscriptionId "SubscriptionID"

$RGname="****"
$portRDP=3389
$rulenameRDP="****"
$nsgname="****"

# Get the NSG resource
$nsg = Get-AzNetworkSecurityGroup -Name $nsgname -ResourceGroupName $RGname

# Add the inbound security rule.
$nsg | Add-AzNetworkSecurityRuleConfig -Name $rulenameRDP -Description "Allow RDP Port from Gateway VNet" -Access Allow `
    -Protocol * -Direction Inbound -Priority 3891 -SourceAddressPrefix "****" -SourcePortRange * `
    -DestinationAddressPrefix * -DestinationPortRange $portRDP

$portSSH=22
$rulenameSSH="SSHfromGatewayVNet"

$nsg | Add-AzNetworkSecurityRuleConfig -Name $rulenameSSH -Description "Allow SSH Port from Gateway VNet" -Access Allow `
    -Protocol * -Direction Inbound -Priority 3892 -SourceAddressPrefix "****" -SourcePortRange * `
    -DestinationAddressPrefix * -DestinationPortRange $portSSH

# Update the NSG.
$nsg | Set-AzNetworkSecurityGroup

Disconnect-AzAccount