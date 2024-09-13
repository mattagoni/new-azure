##Deploy PaloFirewall into Hub vNET
New-AzResourceGroupDeployment -ResourceGroupName "magoni" -TemplateFile "/home/matthew/new-azure/paindeploytemplate.json" -TemplateParameterFile "/home/matthew/new-azure/paindeployparameters.json"

#Add AllowAll to Mgt interface
$nic = Get-AzNetworkInterface -ResourceGroupName "magoni" -Name "pan01-nic"
$nsg = Get-AzNetworkSecurityGroup -ResourceGroupName "magoni" -Name "AllowAll"
$nic.NetworkSecurityGroup = $nsg
$nic | Set-AzNetworkInterface
