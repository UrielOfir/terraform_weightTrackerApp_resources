<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.99.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_DBvm"></a> [DBvm](#module\_DBvm) | ./VMs/DBvm | n/a |
| <a name="module_webAppVMs"></a> [webAppVMs](#module\_webAppVMs) | ./VMs/webAppVMs | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.webApp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.webApp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.LB-healthProbe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.LB-rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_network_interface_backend_address_pool_association.LB](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_security_group.DBNsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.webApp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.LB-PIp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.DB](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.webApp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.DB](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.webApp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_DB-VMPassword"></a> [DB-VMPassword](#input\_DB-VMPassword) | The Azure Region in which all resources in this example should be created. | `string` | `"p@ssw0rd7532!"` | no |
| <a name="input_DB-VMUserName"></a> [DB-VMUserName](#input\_DB-VMUserName) | The Azure Region in which all resources in this example should be created. | `string` | `"DBUser"` | no |
| <a name="input_DBPrefix"></a> [DBPrefix](#input\_DBPrefix) | The prefix which should be used for all resources connected to the database. | `string` | `"DB"` | no |
| <a name="input_appPort"></a> [appPort](#input\_appPort) | The port on which the web app should be listening. | `number` | `8080` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which all resources in this example should be created. | `string` | `"eastus"` | no |
| <a name="input_machinesAmmount"></a> [machinesAmmount](#input\_machinesAmmount) | The number of machines to be created. | `number` | `2` | no |
| <a name="input_webAppPrefix"></a> [webAppPrefix](#input\_webAppPrefix) | The prefix which should be used for all resources connected to the web app. | `string` | `"webApp"` | no |
| <a name="input_webAppVMPassword"></a> [webAppVMPassword](#input\_webAppVMPassword) | The Azure Region in which all resources in this example should be created. | `string` | `"P@ssw0rd1234!"` | no |
| <a name="input_webAppVMUserName"></a> [webAppVMUserName](#input\_webAppVMUserName) | The Azure Region in which all resources in this example should be created. | `string` | `"webappUser"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_passwords"></a> [passwords](#output\_passwords) | The passwords to connect the virtual machines |
<!-- END_TF_DOCS -->