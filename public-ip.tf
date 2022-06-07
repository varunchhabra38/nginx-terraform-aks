# resource "azurerm_public_ip" "public_ip" {
#   name                = "frontend-public-ip-${var.environment}"
#   location            = azurerm_resource_group.aks_rg.location
#   resource_group_name = azurerm_resource_group.aks_rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"

#   tags = var.tags
# }