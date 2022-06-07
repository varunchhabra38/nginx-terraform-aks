resource "azuread_group" "aks_administrators" {
  display_name = "${azurerm_resource_group.aks_rg.name}-cluster-admin"
  description   = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.aks_rg.name}-cluster"
}
