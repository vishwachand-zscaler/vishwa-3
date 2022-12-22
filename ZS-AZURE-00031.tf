resource "azurerm_virtual_machine" "my-windows-vm" {
  name                  = "my-windows-vm"
  location              = "California"
  resource_group_name   = "some-rg"
  network_interface_ids = ["some-id"]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    os_type           = "Windows"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    managed_disk_id   = ""
  }

  os_profile_windows_config {
  }
}

resource "azurerm_managed_disk" "my-managed-disk" {
  create_option        = "Empty"
  location             = "California"
  name                 = "my-managed-disk-1"
  resource_group_name  = "some-rg"
  storage_account_type = "Standard_LRS"
  disk_encryption_set_id = ""
}

resource "azurerm_key_vault" "example" {
  name                        = "des-example-keyvault"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "premium"
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
}

resource "azurerm_key_vault_key" "example" {
  name         = "des-example-key"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

resource "azurerm_disk_encryption_set" "example" {
  name                = "des"
  resource_group_name = "some-rg"
  location            = "California"
  key_vault_key_id    = azurerm_key_vault_key.example.id
  encryption_type     = "EncryptionAtRestWithCustomerKey"
  identity {
    type = "SystemAssigned"
  }
}
