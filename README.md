# Terraform Module: Azure Key Vault

This Terraform module provisions an Azure Key Vault and configures it with access policies and permissions for keys and secrets.

## Requirements

- Terraform 0.12 or higher
- Azure Provider (`azurerm` version >= 2.0)

## Module Inputs

| Name                        | Description                                                        | Type           | Default | Required |
|-----------------------------|--------------------------------------------------------------------|----------------|---------|----------|
| `prefix`                    | Prefix for the Key Vault name                                      | string         | N/A     | Yes      |
| `soft_delete_retention_days` | Number of days for soft delete retention                           | number         | N/A     | Yes      |
| `sku_name`                  | SKU name for the Key Vault                                          | string         | N/A     | Yes      |
| `resource_group_name`       | Name of the Resource Group for the Key Vault                       | string         | N/A     | Yes      |
| `resource_group_location`   | Location of the Resource Group                                    | string         | N/A     | Yes      |
| `key_permissions`           | List of key permissions for the Key Vault                          | list(string)   | N/A     | Yes      |
| `secret_permissions`        | List of secret permissions for the Key Vault                       | list(string)   | N/A     | Yes      |

## Module Outputs

| Name       | Description                             |
|------------|-----------------------------------------|
| `key_vault_id` | The ID of the created Key Vault       |

## Example Usage

### Basic Example

```hcl
module "key_vault" {
  source                     = "./modules/kv"
  prefix                     = var.prefix
  soft_delete_retention_days = var.soft_delete_retention_days
  sku_name                   = var.sku_name
  resource_group_name        = module.azurerm_resource_group.resource_group_name
  resource_group_location    = module.azurerm_resource_group.resource_group_location
  key_permissions            = var.key_permissions
  secret_permissions         = var.secret_permissions
}

module "key_vault_secret" {
  source        = "./modules/kv_secret"
  key_vault_id  = module.key_vault.key_vault_id
  secret_value  = var.secret_value
  secret_name   = "vmpassword"
}


Input Variables
prefix: A string to define the prefix for the Key Vault name. Example: "myapp-kv"
soft_delete_retention_days: The number of days for soft delete retention.
sku_name: The SKU for the Key Vault. It can be "standard" or "premium".
resource_group_name: Name of the Resource Group where the Key Vault will be created.
resource_group_location: Location of the Resource Group.
key_permissions: List of key permissions. Example: ["get", "list", "create"]
secret_permissions: List of secret permissions. Example: ["get", "set", "delete"]
Outputs
key_vault_id: The ID of the created Azure Key Vault.








