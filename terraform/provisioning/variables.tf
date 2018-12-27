# Declare Azure variables
#########################

variable "subscription_id" {default = "e73c1dbe-2574-4f38-9e8f-c813757b1786"}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "location" {default = "West US2"}
variable "resource_group_name" {default = "TFAKS-RG"}
variable "dns_prefix" {default = "mytfaks"}
variable "count" {default = "1"}
variable "vm_sku" {default = "Standard_D4s_v3"}
variable "os_disk_size_gb" {default = "30"}
variable "os_type" {default = "Linux"}
variable "ssh_public_key" {default = "~/.ssh/id_rsa.pub"}
variable "admin_username" {default = "ubuntu"}