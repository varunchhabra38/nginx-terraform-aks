variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "Australia East"
}

# Azure Resource Group Name
variable "resource_group_name" {
  type = string
  description = "This variable defines the Resource Group"
  default = "terraform-aks"
}

variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
  }
}

# Azure AKS Environment Name
variable "environment" {
  type = string  
  description = "This variable defines the Environment"  
  default = "dev"
}
variable "virtual_network_address_prefix" {
  description = "VNET address prefix"
  default     = "192.168.0.0/16"
}
variable "aks_subnet_address_prefix" {
  description = "Subnet address prefix."
  default     = "192.168.0.0/24"
}


variable "app_gateway_subnet_address_prefix" {
  description = "Subnet server IP address."
  default     = "192.168.1.0/24"
}
variable "aks_subnet_name" {
  description = "Subnet Name."
  default     = "aks_subnet"
}
variable "appgateway_subnet_name" {
  description = "Subnet Name."
  default     = "appgwsubnet"
}
variable "app_gateway_name" {
  description = "Name of the Application Gateway"
  default     = "ingress-app-gateway"
}

variable "app_gateway_sku" {
  description = "Name of the Application Gateway SKU"
  default     = "Standard_v2"
}

variable "app_gateway_tier" {
  description = "Tier of the Application Gateway tier"
  default     = "Standard_v2"
}
# AKS Input Variables

# SSH Public Key for Linux VMs
variable "ssh_public_key" {
  default = "./sshkeys/aks-terraform-ssh-key.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"  
}




