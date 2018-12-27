resource "azurerm_resource_group" "tfaks" {
  name     = "${var.resource_group_name}" // Injected from TF_VAR environment variable
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "tfaks" {
  name                = "tfaks" //The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created.
  location            = "${azurerm_resource_group.tfaks.location}"
  resource_group_name = "${azurerm_resource_group.tfaks.name}"
  dns_prefix          = "${var.dns_prefix}"

agent_pool_profile {
    name            = "default"
    count           = "${var.count}"
    vm_size         = "${var.vm_sku}"
    os_type         = "${var.os_type}"
    os_disk_size_gb = "${var.os_disk_size_gb}"
  }

service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

linux_profile {
    admin_username = "${var.admin_username}"

ssh_key {
    key_data = "${file("${var.ssh_public_key}")}"
  }
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