# Declare Azure variables
#########################

variable "subscription_id" {default = "e73c1dbe-2574-4f38-9e8f-c813757b1786"}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "location" {default = "westus2"}
variable "azure_resource_group" {default = "TFAKS"}
variable "dns_prefix" {default = "mytfaks"}
variable "count" {default = "1"}
variable "vm_size" {default = "Standard_D4s_v3"}
variable "os_disk_size_gb" {default = "30"}
#variable "sshRSAPublicKey" {}
#variable "enableDiagnostics" {default = false}
#variable "servicePrincipalClientId" {}
#variable "servicePrincipalClientSecret" {}
variable "os_type" {default = "Linux"}
