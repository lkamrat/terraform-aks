# Declare Azure variables
#########################

variable "subscription_id" {default = "e73c1dbe-2574-4f38-9e8f-c813757b1786"}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "spn_url" {default = "http://balerion"}
variable "location" {default = "West Europe"}
variable "my_resource_group" {}
variable "resourceName" {}
variable "dnsNamePrefix" {}
variable "masterDnsNamePrefix" {default = "k8smaster"}
variable "agentDnsNamePrefix" {default = "k8sagent"}
variable "agentCount" {default = "1"}
variable "agentVMSize" {default = "Standard_D2_v2"}
variable "linuxAdminUsername" {}
variable "windowsAgentAdminUsername" {}
variable "windowsAgentAdminPassword" {}
variable "orchestratorType" {default = "Kubernetes"}
variable "masterCount" {default = "1"}
variable "sshRSAPublicKey" {}
variable "enableDiagnostics" {default = false}
variable "servicePrincipalClientId" {}
variable "servicePrincipalClientSecret" {}
variable "osType" {default = "Linux"}
variable "ukRegion" {default = false}