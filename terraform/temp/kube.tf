# Create new Azure Resource Group deployment 

resource "azurerm_resource_group" "balerion" {
  name     = "${var.my_resource_group}" // Injected from TF_VAR environment variable
  location = "${var.location}"
}

# Use ARM template deploymet terraform module

resource "azurerm_template_deployment" "balerion" {
  name                = "${var.my_resource_group}"
  resource_group_name = "${azurerm_resource_group.balerion.name}"

  template_body = "${file("/tmp/tfdeployment/armtemplate.json")}"

# The ARM teamplate JSON parameters

  parameters = {
    dnsNamePrefix                   = "${var.dnsNamePrefix}" // Injected from TF_VAR environment variable
    agentVMSize                     = "${var.agentVMSize}"
    linuxAdminUsername              = "${var.linuxAdminUsername}" // Injected from TF_VAR environment variable
    orchestratorType                = "${var.orchestratorType}"
    sshRSAPublicKey                 = "${var.sshRSAPublicKey}" // Injected from TF_VAR environment variable
    servicePrincipalClientId        = "${var.servicePrincipalClientId}" // Injected from TF_VAR environment variable
    servicePrincipalClientSecret    = "${var.servicePrincipalClientSecret}" // Injected from TF_VAR environment variable
  }

provisioner "local-exec" {
  command = "az login --service-principal -u ${var.client_id} -p ${var.client_secret} --tenant ${var.tenant_id}"
    }

provisioner "local-exec" {
  command = "sleep 120"
  }

provisioner "local-exec" {
  command = "az acs kubernetes get-credentials --resource-group=${var.my_resource_group} --name=containerservice-${var.my_resource_group}"
    }

# Run K8s applications deployment scripts using kubectl

provisioner "local-exec" {
  command = "run-parts ./tmp/tfdeployment/k8s-scripts"
    }         

provisioner "local-exec" {
  command = "kubectl expose deployment my-meetup --port=80 --type=LoadBalancer"
    }

provisioner "local-exec" {
  command = "sleep 60"
  }

provisioner "local-exec" {
  command = "kubectl get svc > /mnt/your_service.txt"
    }       

  deployment_mode = "Incremental"
}
