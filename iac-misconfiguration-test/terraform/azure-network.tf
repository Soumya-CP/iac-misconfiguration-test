resource "azurerm_storage_account" "weak_storage" {
  name                     = "syntheticstorageacct"
  resource_group_name      = "rg-fixture"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # TESTCASE: IAC-004 Azure Blob public access enabled
  allow_nested_items_to_be_public = true
  # TESTCASE: IAC-005 HTTPS-only enforcement disabled
  enable_https_traffic_only = false
  min_tls_version           = "TLS1_0"
}

resource "azurerm_key_vault" "weak_vault" {
  name                = "kv-synthetic-fixture"
  location            = "eastus"
  resource_group_name = "rg-fixture"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"
  # TESTCASE: IAC-006 Key Vault purge protection disabled
  purge_protection_enabled = false
}

resource "azurerm_network_security_rule" "open_ssh" {
  name                        = "allow-ssh-from-anywhere"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  # TESTCASE: IAC-007 SSH open to the internet
  source_address_prefix       = "0.0.0.0/0"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "open_rdp" {
  name                        = "allow-rdp-from-anywhere"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  # TESTCASE: IAC-008 RDP open to the internet
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
