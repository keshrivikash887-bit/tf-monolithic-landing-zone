


module "resource_group"{
    source = "../../modules/azurerm_resource_group"
    rgs=var.rgs
}

module "virtual_network" {
    depends_on = [ module.resource_group ]

    source="../../modules/azurerm_virtual_network"
    vnet=var.vnet
  
}

module "subnet"{
    depends_on = [ module.virtual_network ]
    source = "../../modules/azurerm_subnet"

    subnet=var.subnet
    
}

module "public_ip" {
    depends_on = [ module.resource_group ]
    source = "../../modules/azurerm_public_ip"

    public_ip = var.public_ip
  
}


module "network_interface" {
    depends_on = [ module.public_ip,module.subnet ]
    source = "../../modules/azurerm_network_interface"
   

   network_interface=var.network_interface

  
}

module "vms"{
    depends_on = [ module.network_interface ]
    source = "../../modules/azurerm_virtual_machine"
    
    vms=var.vms

}

module "bastion" {
    depends_on = [ module.virtual_network ]
    source="../../modules/azurerm_bastion"

    bastion=var.bastion
  
}