

rgs={
          rg1={
            name="babaTillu"
            location="eastus"
          }
          
 }  
 
 vnet={
  vnet1={
        name="jio-vnet"
        location="eastus"
        resource_group_name="babaTillu"
        address_space=["10.0.0.0/16"]

    }
 }     

 subnet={
  
        subnet1={
            name="frontend-subnet"
            resource_group_name="babaTillu"
            virtual_network_name="jio-vnet"
            address_prefixes=["10.0.1.0/24"]
        }

         subnet2={
            name="backend-subnet"
            resource_group_name="babaTillu"
            virtual_network_name="jio-vnet"
            address_prefixes=["10.0.2.0/24"]
        }

        subnet3={
              name="AzureBastionSubnet"
              resource_group_name="babaTillu"
              virtual_network_name="jio-vnet"
              address_prefixes=["192.168.1.224/27"]
        }
    
 }


 public_ip = {
  
        pip1={
            name="frontend-pip"
            resource_group_name="babaTillu"
            location="eastus"
            allocation_method="Static"
        }

         pip2={
            name="backend-pip"
            resource_group_name="babaTillu"
            location="eastus"
            allocation_method="Static"
        }
        pip3={
             name="bastion-pip"
             resource_group_name="babaTillu"
             location="eastus"
             allocation_method="Static" 
        }
    
 }


 network_interface = {
  
        nic1={
               name="frontend-nic"
               location="eastus"
               resource_group_name="babaTillu"
               subnet_name="frontend-subnet"
               vnet_name="jio-vnet"
               pip_name="frontend-pip"

        }

        nic2={
              name="backend-nic"
               location="eastus"
               resource_group_name="babaTillu"
               subnet_name="backend-subnet"
               vnet_name="jio-vnet"
               pip_name="backend-pip"

        }
   
 }


 vms={
       
        vm1={
            vm_name="frontend-vm"
            resource_group_name="babaTillu"
            location="eastus"
            vm_size="Standard_D2s_v3"
            admin_username="azureuser"
            admin_password="babaTillu@#$887"
            nic_name="frontend-nic"

        }
         vm1={
            vm_name="backend-vm"
            resource_group_name="babaTillu"
            location="eastus"
            vm_size="Standard_D2s_v3"
            admin_username="azureuser"
            admin_password="babaTillu@#$887"
            nic_name="backend-nic"
            
        }


    
 }


 bastion = {
       
        bastion1={
            name="azurebastion"
            location="eastus"
            resource_group_name="babaTillu"
            
        }
    
 }


