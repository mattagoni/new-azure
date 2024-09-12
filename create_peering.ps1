##Create vNET Peering Hub and Spoke - use this when there is no VPN gateway in place - all neworking is done via pan then add the UDR routes

$SpokeRG = "magoni"
$SpokeRM = "VicNetwork"
$HubRG   = "magoni"
$HubRM   = "HubNetwork"
$spokermvnet = Get-AzVirtualNetwork -Name $SpokeRM -ResourceGroup $SpokeRG
$hubrmvnet   = Get-AzVirtualNetwork -Name $HubRM -ResourceGroup $HubRG
Add-AzVirtualNetworkPeering -Name vic_to_hub -VirtualNetwork $spokermvnet -RemoteVirtualNetworkId $hubrmvnet.Id 
Add-AzVirtualNetworkPeering -Name hub_to_vic -VirtualNetwork $hubrmvnet -RemoteVirtualNetworkId $spokermvnet.Id -AllowGatewayTransit

$SpokeRG = "magoni"
$SpokeRM = "NswNetwork"
$HubRG   = "magoni"
$HubRM   = "HubNetwork"
$spokermvnet = Get-AzVirtualNetwork -Name $SpokeRM -ResourceGroup $SpokeRG
$hubrmvnet   = Get-AzVirtualNetwork -Name $HubRM -ResourceGroup $HubRG
Add-AzVirtualNetworkPeering -Name nsw_to_hub -VirtualNetwork $spokermvnet -RemoteVirtualNetworkId $hubrmvnet.Id 
Add-AzVirtualNetworkPeering -Name hub_to_nsw -VirtualNetwork $hubrmvnet -RemoteVirtualNetworkId $spokermvnet.Id -AllowGatewayTransit

$SpokeRG = "magoni"
$SpokeRM = "UsaNetwork"
$HubRG   = "magoni"
$HubRM   = "HubNetwork"
$spokermvnet = Get-AzVirtualNetwork -Name $SpokeRM -ResourceGroup $SpokeRG
$hubrmvnet   = Get-AzVirtualNetwork -Name $HubRM -ResourceGroup $HubRG
Add-AzVirtualNetworkPeering -Name usa_to_hub -VirtualNetwork $spokermvnet -RemoteVirtualNetworkId $hubrmvnet.Id 
Add-AzVirtualNetworkPeering -Name hub_to_usa -VirtualNetwork $hubrmvnet -RemoteVirtualNetworkId $spokermvnet.Id -AllowGatewayTransit
