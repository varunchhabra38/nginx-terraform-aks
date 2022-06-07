data "azurerm_resource_group" "node_resource_group" {
  name = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster
  ]
}
 
resource "azurerm_role_assignment" "node_infrastructure_update_scale_set" {
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  scope                = data.azurerm_resource_group.node_resource_group.id
  role_definition_name = "Virtual Machine Contributor"
  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster
  ]
}

resource "azurerm_role_assignment" "aks_role" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster,azurerm_container_registry.acr
  ]
}


