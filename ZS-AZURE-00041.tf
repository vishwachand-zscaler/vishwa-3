resource "azurerm_virtual_machine" "example-41" {
  name                  = "example-41"
  location              = "California"
  resource_group_name   = "some-rg"
  network_interface_ids = ["some-id"]
  vm_size               = "Standard_DS1_v2"

  storage_data_disk {
    create_option = "Empty"
    lun           = 0
    name          = "my-data-disk"
    managed_disk_type = "Standard_LRS"
    managed_disk_id   = ""
  }

  storage_os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    os_type           = "Linux"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    managed_disk_id   = ""
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
