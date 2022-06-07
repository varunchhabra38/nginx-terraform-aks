data "azurerm_subnet" "kubesubnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  resource_group_name  = azurerm_resource_group.aks_rg.name
  depends_on           = [azurerm_virtual_network.aksvnet.subnet.kubesubnet]
}

data "azurerm_subnet" "appgwsubnet" {
  name                 = "appgwsubnet"
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  resource_group_name  = azurerm_resource_group.aks_rg.name
  depends_on           = [azurerm_virtual_network.aksvnet.subnet.appgwsubnet]
}