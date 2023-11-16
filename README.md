<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_web_app.azure_web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot.deployment_slots](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
| [azurerm_monitor_diagnostic_setting.web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_client_config.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_origins_list"></a> [allowed\_origins\_list](#input\_allowed\_origins\_list) | Provides site list for cors | `list(any)` | n/a | yes |
| <a name="input_always_on"></a> [always\_on](#input\_always\_on) | Site config for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#site_config. | `bool` | `false` | no |
| <a name="input_app_command_line"></a> [app\_command\_line](#input\_app\_command\_line) | The App command line to launch | `string` | `""` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Provides the app name | `string` | n/a | yes |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The ID of the external App Service Plan (required if create\_app\_service\_plan is false). | `string` | `""` | no |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | Provides the app settings for web app | `map(string)` | `null` | no |
| <a name="input_application_stack"></a> [application\_stack](#input\_application\_stack) | The application stack for this app | <pre>object({<br>    dotnet_version = string<br>  })</pre> | `null` | no |
| <a name="input_auth_settings"></a> [auth\_settings](#input\_auth\_settings) | Authentication settings. Issuer URL is generated thanks to the tenant ID. For active\_directory block, the allowed\_audiences list is filled with a value generated with the name of the App Service. See https://www.terraform.io/docs/providers/azurerm/r/app_service.html#auth_settings | `any` | `{}` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | Connection strings for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#connection_string | `list(map(string))` | `[]` | no |
| <a name="input_cors_support_credentials"></a> [cors\_support\_credentials](#input\_cors\_support\_credentials) | Provides the support for cors credentials | `string` | n/a | yes |
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | Any custom tags to add to the resource. | `map(string)` | `{}` | no |
| <a name="input_deployment_slots"></a> [deployment\_slots](#input\_deployment\_slots) | A list of deployment slots to create. It will have the same settings as the production slot | `list(string)` | `[]` | no |
| <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name) | Specifies the name of the Diagnostic settings | `string` | `""` | no |
| <a name="input_diagnostic_settings"></a> [diagnostic\_settings](#input\_diagnostic\_settings) | Set to true to create Diagnostic Settings in the App. | `bool` | `false` | no |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. | `string` | `""` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | Specifies the name of the Event Hub where Diagnostics Data should be sent. | `string` | `""` | no |
| <a name="input_ftps_state"></a> [ftps\_state](#input\_ftps\_state) | Pen Test output mandated to Disable/Enable FTP / FTPS service for App Service by default. See documentation for all options. Possible values include: AllAllowed, FtpsOnly and Disabled. See documentation https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service#ftps_state | `string` | `"Disabled"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Path which will be checked for this app health | `string` | `null` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Can the App only be accessed via HTTPS? | `bool` | `true` | no |
| <a name="input_ip_restriction"></a> [ip\_restriction](#input\_ip\_restriction) | Site config for IP Restrictions. See documentaton https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app#ip_restriction | `list(any)` | `[]` | no |
| <a name="input_linux_fx_version"></a> [linux\_fx\_version](#input\_linux\_fx\_version) | linux\_fx\_version in site\_config | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Azure Container Registry. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_scm_use_main_ip_restriction"></a> [scm\_use\_main\_ip\_restriction](#input\_scm\_use\_main\_ip\_restriction) | Should the App ip\_restriction configuration be used for the SCM also. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag map with default values. | `map(string)` | `{}` | no |
| <a name="input_use_32_bit_worker"></a> [use\_32\_bit\_worker](#input\_use\_32\_bit\_worker) | Should the Linux Web App use a 32-bit worker? | `bool` | `false` | no |
| <a name="input_virtual_network_subnet_id"></a> [virtual\_network\_subnet\_id](#input\_virtual\_network\_subnet\_id) | The subnet id which will be used by this App for regional virtual network integration. | `string` | `null` | no |
| <a name="input_vnet_route_all_enabled"></a> [vnet\_route\_all\_enabled](#input\_vnet\_route\_all\_enabled) | Route all traffic through the connected VNET when integrated. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app#vnet_route_all_enabled | `string` | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | The default hostname associated with the Web App - such as mysite.azurewebsites.net |
| <a name="output_id"></a> [id](#output\_id) | Web app ID. |
| <a name="output_name"></a> [name](#output\_name) | Web app name. |
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | Outbound IP addresses of the Web App |
| <a name="output_possible_outbound_ip_addresses"></a> [possible\_outbound\_ip\_addresses](#output\_possible\_outbound\_ip\_addresses) | Possible outbound IP addresses of the Web App |
| <a name="output_principal_ids"></a> [principal\_ids](#output\_principal\_ids) | n/a |
<!-- END_TF_DOCS -->