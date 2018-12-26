resource "azurerm_resource_group" "tfaks" {
  name     = "${var.azure_resource_group}" // Injected from TF_VAR environment variable
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "tfaks" {
  name                = "tfaks"
  location            = "${var.location}"
  resource_group_name = "${var.azure_resource_group}"
  dns_prefix          = "${var.dns_prefix}"

agent_pool_profile {
    name            = "default"
    count           = "${var.count}"
    vm_size         = "${var.vm_size}"
    os_type         = "Linux"
    os_disk_size_gb = "${var.os_disk_size_gb}"
  }

service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

role_based_access_control {
    enabled = true
  }

tags {
    Environment = "Dev"
  }
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.tfaks.kube_config.0.client_certificate}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.tfaks.kube_config_raw}"
}