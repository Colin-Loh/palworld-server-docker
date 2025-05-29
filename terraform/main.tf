resource "azurerm_resource_group" "this" {
  name     = "rg-palworld-server-docker"
  location = "australiaeast"
}

resource "azurerm_container_registry" "this" {
  name                = "acrtestserverdocker"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "Standard"
  admin_enabled       = true
}

# resource "azurerm_kubernetes_cluster" "this" {
#   name                = format("aks%s", local.name_suffix)
#   location            = azurerm_resource_group.this.location
#   resource_group_name = azurerm_resource_group.this.name
#   dns_prefix          = format("dns%s", local.name_suffix)

#   default_node_pool {
#     name            = "default"
#     vm_size         = "Standard_B2ms"
#     node_count      = 1
#     os_disk_size_gb = 64
#     os_disk_type    = "Managed"
#   }

#   identity {
#     type = "SystemAssigned"
#   }
# }

# resource "azurerm_role_assignment" "this" {
#   principal_id                     = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.this.id
#   skip_service_principal_aad_check = true
# }
