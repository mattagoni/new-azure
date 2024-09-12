##Create Default Routes for Networks back to PAN
az network route-table create --name NSWROUTETABLE --resource-group magoni --location Australiaeast
az network route-table route create -g magoni --route-table-name NSWROUTETABLE -n NSWROUTETABLE --next-hop-type VirtualAppliance --address-prefix 0.0.0.0/0 --next-hop-ip-address 10.100.1.4
az network vnet subnet update -g magoni -n network1 --vnet-name NswNetwork --route-table NSWROUTETABLE

az network route-table create --name VICROUTETABLE --resource-group magoni --location AustraliaSoutheast
az network route-table route create -g magoni --route-table-name VICROUTETABLE -n VICROUTETABLE --next-hop-type VirtualAppliance --address-prefix 0.0.0.0/0 --next-hop-ip-address 10.100.1.4
az network vnet subnet update -g magoni -n network1 --vnet-name VICNetwork --route-table VICROUTETABLE

az network route-table create --name USAROUTETABLE --resource-group magoni--location WESTUS
az network route-table route create -g magoni--route-table-name USAROUTETABLE -n USAROUTETABLE --next-hop-type VirtualAppliance --address-prefix 0.0.0.0/0 --next-hop-ip-address 10.100.1.4
az network vnet subnet update -g magoni-n network1 --vnet-name USANetwork --route-table USAROUTETABLE
