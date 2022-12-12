resource "azurerm_virtual_machine" "my-linux-vm_33" {
  name                  = "my-linux-vm"
  location              = "California"
  resource_group_name   = "some-rg"
  network_interface_ids = ["some-id"]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    os_type           = "Linux"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    vhd_uri           = "some-image-uri"
  }

  os_profile_linux_config {
    disable_password_authentication = true
  }
}
