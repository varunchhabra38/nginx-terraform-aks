resource "azurerm_resource_group" "aks_rg" {
  name = "${var.resource_group_name}-${var.environment}"
  location = var.location
}
resource "azurerm_resource_group" "aks_node_rg" {
  name = "${var.resource_group_name}-${var.environment}-nrg"
  location = var.location
}
