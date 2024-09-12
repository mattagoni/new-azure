##Create Vic Network
$virtualNetwork = New-AzVirtualNetwork -ResourceGroupName magoni -Location AustraliaSouthEast -Name VicNetwork -AddressPrefix 10.1.0.0/16
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name Network1 -AddressPrefix 10.1.1.0/24 -VirtualNetwork $virtualNetwork
#$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name Mgt -AddressPrefix 10.1.100.0/24 -VirtualNetwork $virtualNetwork
#$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name Untrust -AddressPrefix 10.1.200.0/24 -VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork

##Create NSW Network
$virtualNetwork = New-AzVirtualNetwork -ResourceGroupName magoni -Location AustraliaEast -Name NswNetwork -AddressPrefix 10.5.0.0/16
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name Network1 -AddressPrefix 10.5.1.0/24 -VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork

##Create USANetwork
$virtualNetwork = New-AzVirtualNetwork -ResourceGroupName magoni -Location WestUS -Name UsaNetwork -AddressPrefix 10.10.0.0/16
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name Network1 -AddressPrefix 10.10.1.0/24 -VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork

##Create HubNetwork
$virtualNetwork = New-AzVirtualNetwork -ResourceGroupName magoni -Location AustraliaSouthEast -Name HubNetwork -AddressPrefix 10.100.0.0/16
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name Network1 -AddressPrefix 10.100.1.0/24 -VirtualNetwork $virtualNetwork
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name Mgt -AddressPrefix 10.100.2.0/24 -VirtualNetwork $virtualNetwork
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name Untrust -AddressPrefix 10.100.3.0/24 -VirtualNetwork $virtualNetwork
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name GatewaySubnet -AddressPrefix 10.100.100.0/27 -VirtualNetwork $virtualNetwork
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name AzureBastionSubnet -AddressPrefix 10.100.10.0/27 -VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork
