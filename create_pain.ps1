##Deploy PaloFirewall into Hub vNET
New-AzResourceGroupDeployment -ResourceGroupName "magoni" -TemplateFile "/home/matthew/new-azure/pandeploytemplate.json" -TemplateParameterFile "/home/matthew/new-azure/pandeploymentparameters.json"
