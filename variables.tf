## Common Variables
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure Container Registry. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "custom_tags" {
  type        = map(string)
  description = "Any custom tags to add to the resource."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Tag map with default values."
  default     = {}
}

variable "connection_strings" {
  description = "Connection strings for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#connection_string"
  type        = list(map(string))
  default     = []
}

variable "auth_settings" {
  description = "Authentication settings. Issuer URL is generated thanks to the tenant ID. For active_directory block, the allowed_audiences list is filled with a value generated with the name of the App Service. See https://www.terraform.io/docs/providers/azurerm/r/app_service.html#auth_settings"
  type        = any
  default     = {}
}

variable "app_service_plan_id" {
  description = "The ID of the external App Service Plan (required if create_app_service_plan is false)."
  type        = string
  default     = ""
}

## Web App
variable "app_name" {
  description = "Provides the app name"
  type        = string
}

variable "app_settings" {
  description = "Provides the app settings for web app"
  type        = map(string)
  default     = null
}

variable "allowed_origins_list" {
  description = "Provides site list for cors"
  type        = list(any)
}

variable "cors_support_credentials" {
  description = "Provides the support for cors credentials"
  type        = string
}

variable "linux_fx_version" {
  description = "linux_fx_version in site_config"
  type        = string
  default     = ""
}

variable "always_on" {
  description = "Site config for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#site_config."
  type        = bool
  default     = false
}

variable "ip_restriction" {
  description = "Site config for IP Restrictions. See documentaton https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app#ip_restriction"
  type        = list(any)
  default     = []
}

variable "https_only" {
  description = "Can the App only be accessed via HTTPS?"
  type        = bool
  default     = true
}

variable "ftps_state" {
  description = "Pen Test output mandated to Disable/Enable FTP / FTPS service for App Service by default. See documentation for all options. Possible values include: AllAllowed, FtpsOnly and Disabled. See documentation https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service#ftps_state"
  type        = string
  default     = "Disabled"
}

variable "vnet_route_all_enabled" {
  description = "Route all traffic through the connected VNET when integrated. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app#vnet_route_all_enabled"
  type        = string
  default     = "false"
}

variable "health_check_path" {
  description = "Path which will be checked for this app health"
  type        = string
  default     = null
}

# azurerm_monitor_diagnostic_setting - configure the below variables to send logs and metrics to Event Hubs
variable "diagnostic_settings" {
  description = "Set to true to create Diagnostic Settings in the App."
  type        = bool
  default     = false
}

variable "eventhub_name" {
  description = "Specifies the name of the Event Hub where Diagnostics Data should be sent."
  type        = string
  default     = ""
}

variable "eventhub_authorization_rule_id" {
  description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data."
  type        = string
  default     = ""
}


variable "diagnostic_setting_name" {
  description = "Specifies the name of the Diagnostic settings"
  type        = string
  default     = ""
}

variable "virtual_network_subnet_id" {
  description = "The subnet id which will be used by this App for regional virtual network integration."
  type        = string
  default     = null
}

variable "scm_use_main_ip_restriction" {
  description = "Should the App ip_restriction configuration be used for the SCM also."
  type        = bool
  default     = false
}

variable "application_stack" {
  description = "The application stack for this app"
  type = object({
    dotnet_version = string
  })
  default = null
}

variable "deployment_slots" {
  description = "A list of deployment slots to create. It will have the same settings as the production slot"
  type        = list(string)
  default     = []
}

variable "app_command_line" {
  description = "The App command line to launch"
  default     = ""
}

variable "use_32_bit_worker" {
  type        = bool
  description = "Should the Linux Web App use a 32-bit worker?"
  default     = false
}
