##Deploy PaloFirewall into Hub vNET
New-AzResourceGroupDeployment -ResourceGroupName "magoni" -TemplateFile "/home/matthew/new-azure/paindeploytemplate.json" -TemplateParameterFile "/home/matthew/new-azure/paindeployparameters.json"
