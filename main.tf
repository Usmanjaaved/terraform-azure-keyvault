data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "key_vault" {
  name                        = "${var.prefix}-kv"
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = false
  sku_name                    = var.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions   = var.key_permissions
    secret_permissions = var.secret_permissions
}
}
