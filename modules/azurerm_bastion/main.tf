


variable "bastion" {
  
}

data "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "jio-vnet"
  resource_group_name  = "babaTillu"
}


data "azurerm_public_ip" "pip" {
  name                = "bastion-pip"
  resource_group_name = "babaTillu"
}




resource "azurerm_bastion_host" "example" {

  for_each = var.bastion   
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.bastion_subnet.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}