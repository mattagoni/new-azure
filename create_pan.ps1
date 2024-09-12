##Deploy PaloFirewall into Hub vNET
New-AzResourceGroupDeployment -ResourceGroupName "magoni" -TemplateFile "/home/matthew/new-azure/pandeploytemplate.json" -TemplateParameterFile "/home/matthew/new-azure/pandeploymentparameters.json"


##get Palto network ready after template deployment
$nic = Get-AzNetworkInterface -Name paloaltofw-pan-ip-eth0 -ResourceGroup magoni
$nic.IpConfigurations.publicipaddress.id = $null
Set-AzNetworkInterface -NetworkInterface $nic
Remove-AzureRmPublicIpAddress -Name pan-ip -ResourceGroupName magoni -Force

New-AzPublicIpAddress -Name Pan-mgt-Ip -ResourceGroupName magoni -Location 'AustraliaSouthEast' -AllocationMethod static -sku standard -DomainNameLabel whiplashmgt
New-AzPublicIpAddress -Name Pan-untrust-Ip -ResourceGroupName magoni -Location 'AustraliaSouthEast' -AllocationMethod static -sku standard -DomainNameLabel whiplash

$vnet = Get-AzVirtualNetwork -Name HubNetwork -ResourceGroupName magoni
$subnet = Get-AzVirtualNetworkSubnetConfig -Name Mgt -VirtualNetwork $vnet
$nic = Get-AzNetworkInterface -Name paloaltofw-pan-ip-eth0 -ResourceGroupName magoni
$pip = Get-AzPublicIpAddress -Name Pan-mgt-Ip -ResourceGroupName magoni
$nic | Set-AzNetworkInterfaceIpConfig -Name ipconfig-mgmt -PublicIPAddress $pip -Subnet $subnet
$nic | Set-AzNetworkInterface

$vnet = Get-AzVirtualNetwork -Name HubNetwork -ResourceGroupName magoni
$subnet = Get-AzVirtualNetworkSubnetConfig -Name Untrust -VirtualNetwork $vnet
$nic = Get-AzNetworkInterface -Name paloaltofw-pan-ip-eth1 -ResourceGroupName magoni
$pip = Get-AzPublicIpAddress -Name Pan-untrust-Ip -ResourceGroupName magoni
$nic | Set-AzNetworkInterfaceIpConfig -Name ipconfig-untrust -PublicIPAddress $pip -Subnet $subnet
$nic | Set-AzNetworkInterface

$rule1 = New-AzNetworkSecurityRuleConfig -Name ALLIN -Description "Allow ALL IN" -Access Allow -Protocol * -Direction Inbound -Priority 100 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange *
$rule2 = New-AzNetworkSecurityRuleConfig -Name ALLOUT -Description "Allow ALL OUT" -Access Allow -Protocol * -Direction Outbound -Priority 100 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange *
$nsg = New-AzNetworkSecurityGroup -ResourceGroupName magoni -Location australiasoutheast -Name "AllowALL" -SecurityRules $rule1,$rule2


$nic = Get-AzNetworkInterface -ResourceGroupName "magoni" -Name "paloaltofw-pan-ip-eth0"
$nsg = Get-AzNetworkSecurityGroup -ResourceGroupName "magoni" -Name "AllowAll"
$nic.NetworkSecurityGroup = $nsg
$nic | Set-AzNetworkInterface

$nic = Get-AzNetworkInterface -ResourceGroupName "magoni" -Name "paloaltofw-pan-ip-eth1"
$nsg = Get-AzNetworkSecurityGroup -ResourceGroupName "magoni" -Name "AllowAll"
$nic.NetworkSecurityGroup = $nsg
$nic | Set-AzNetworkInterface

$nic = Get-AzNetworkInterface -ResourceGroupName "magoni" -Name "paloaltofw-pan-ip-eth2"
$nsg = Get-AzNetworkSecurityGroup -ResourceGroupName "magoni" -Name "AllowAll"
$nic.NetworkSecurityGroup = $nsg
$nic | Set-AzNetworkInterface
