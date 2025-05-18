# Configure the Microsoft Azure Provider
provider "azurerm" {
  # resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = "3c4d3a6f-a203-48fd-8d99-85c25b48c45f"
}
resource "azurerm_virtual_machine" "test" {
  name                  = "test-vm"
  location              = "UK West"
  resource_group_name   = "deepti-rg"
  network_interface_ids = ["/subscriptions/3c4d3a6f-a203-48fd-8d99-85c25b48c45f/resourceGroups/deepti-rg/providers/Microsoft.Network/networkInterfaces/terraform-testing"]
  vm_size               = "Standard_B2ls_v2"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/3c4d3a6f-a203-48fd-8d99-85c25b48c45f/resourceGroups/deepti-rg/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "test-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "test-vm"
    admin_username = "azuser"
    admin_password = "Chicago12345"

  }
}