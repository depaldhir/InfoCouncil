# # Create a Resource Group
# resource "azurerm_resource_group" "rg_name" {
#   name                  = var.rg_name
#   location              = var.location
#   tags                  = var.tags
# }

# # Create a Virtual Network
# resource "azurerm_virtual_network" "vnet" {
#   name                  = var.vnet_name
#   address_space         = var.vnet_space
#   location              = "australia southeast"
#   resource_group_name   = azurerm_resource_group.example.name
# }

# # Create four subnets with their own Network Security Groups
# resource "azurerm_subnet" "subnet1" {
#   name                  = var.subnet1_name
#   address_prefixes      = var.subnet1_address
#   virtual_network_name  = vnet.vnet_name
#   resource_group_name   = var.rg_name
# }

# resource "azurerm_network_security_group" "nsg1" {
#   name                  = var.nsg1_name
#   location              = var.location
#   resource_group_name   = var.rg_name

#   # Add your security rules for subnet1 here
# }

# resource "azurerm_subnet_network_security_group_association" "subnet1_nsg1" {
#   subnet_id                 = azurerm_subnet.subnet1.id
#   network_security_group_id = azurerm_network_security_group.nsg1.id
# }

# resource "azurerm_subnet" "subnet2" {
#   name                  = var.subnet2_name
#   address_prefixes      = var.subnet2_address
#   virtual_network_name  = vnet.vnet_name
#   resource_group_name   = var.rg_name
# }

# resource "azurerm_network_security_group" "nsg2" {
#   name                  = var.nsg2_name
#   location              = var.location
#   resource_group_name   = var.rg_name

#   # Add your security rules for subnet2 here
# }

# resource "azurerm_subnet_network_security_group_association" "subnet2_nsg2" {
#   subnet_id                 = azurerm_subnet.subnet2.id
#   network_security_group_id = azurerm_network_security_group.nsg2.id
# }

# resource "azurerm_subnet" "subnet3" {
#   name                  = var.subnet3_name
#   address_prefixes      = var.subnet3_address
#   virtual_network_name  = vnet.vnet_name
#   resource_group_name   = var.rg_name
# }

# resource "azurerm_network_security_group" "nsg3" {
#   name                  = var.nsg3_name
#   location              = var.location
#   resource_group_name   = var.rg_name

#   # Add your security rules for subnet3 here
# }

# resource "azurerm_subnet_network_security_group_association" "subnet3_nsg3" {
#   subnet_id                 = azurerm_subnet.subnet3.id
#   network_security_group_id = azurerm_network_security_group.nsg3.id
# }

# resource "azurerm_subnet" "subnet4" {
#   name                  = var.subnet4_name
#   address_prefixes      = var.subnet4_address
#   virtual_network_name  = vnet.vnet_name
#   resource_group_name   = var.rg_name
# }

# resource "azurerm_network_security_group" "nsg4" {
#   name                  = var.nsg4_name
#   location              = var.location
#   resource_group_name   = var.rg_name

#   # Add your security rules for subnet4 here
# }