resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${azurerm_resource_group.aks_rg.name}-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "${azurerm_resource_group.aks_rg.name}-cluster"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks_rg.name}-nrg"

  default_node_pool {
    name                 = "systempool"
    vm_size              = "Standard_B2s"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    enable_auto_scaling  = true
    max_count            = 1
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    vnet_subnet_id        = data.azurerm_subnet.kubesubnet.id 
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "dev"
      "nodepoolos"       = "linux"
    } 
   tags = {
      "nodepool-type"    = "system"
      "environment"      = "dev"
      "nodepoolos"       = "linux"
   } 
  }

  
# Identity (System Assigned or Service Principal)
  identity {
    type = "SystemAssigned"
  }

# Add On Profiles
  addon_profile {
       oms_agent {
      enabled =  true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
    }
  }

  azure_policy_enabled{

  }

  ingress_application_gateway  {
      subnet_id = data.azurerm_subnet.appgwsubnet.id
      gateway_name = "ingress-app-gateway"
  }
# RBAC and Azure AD Integration Block
  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = [azuread_group.aks_administrators.id]
    azure_rbac_enabled =true
  }


# Linux Profile
  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

# Network Profile
  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "Standard"
  }

  tags = {
    Environment = "dev"
  }
}