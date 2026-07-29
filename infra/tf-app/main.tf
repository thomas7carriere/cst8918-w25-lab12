resource "azurerm_resource_group" "app" {
  name     = "deha0036-a12-rg"
  location = "canadacentral"
}
# Create a Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "app-vnet"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  address_space       = ["10.0.0.0/16"]
}

# Create a Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.app.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
