# Secret environment variables to be injected to the bootstrap Docker container
#################################################################################
TF_VAR_client_id=""
TF_VAR_client_secret=""

# Terraform plan environment variables to be injected to the bootstrap Docker container
#########################################################################################
TF_VAR_my_resource_group="Balerion-RG"
TF_VAR_resourceName="balerion"

# Terraform "azurerm_template_deployment" ARM template parameters environment variables to be injected to the bootstrap Docker container
#########################################################################################################################################
TF_VAR_dnsNamePrefix=""
TF_VAR_servicePrincipalClientId=""
TF_VAR_servicePrincipalClientSecret=""
TF_VAR_linuxAdminUsername=""
TF_VAR_windowsAgentAdminUsername=""
TF_VAR_windowsAgentAdminPassword=""
TF_VAR_sshRSAPublicKey=""
