resource "azurerm_virtual_network" "aksvnet" {
  name                = "aks-vnet-${var.environment}"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  address_space       = [var.virtual_network_address_prefix]
}
resource "azurerm_subnet" "aks_subnet" {
  name = var.aks_subnet_name
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  address_prefixes = [var.aks_subnet_address_prefix]
}
 
resource "azurerm_subnet" "appgwsubnet" {
   name = var.appgwsubnet
   resource_group_name  = azurerm_resource_group.aks_rg.name
   virtual_network_name = azurerm_virtual_network.aksvnet.name
   address_prefixes = [var.app_gateway_subnet_address_prefix]
}