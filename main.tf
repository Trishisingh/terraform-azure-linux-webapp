data "azurerm_client_config" "main" {}

resource "azurerm_linux_web_app" "azure_web_app" {
  name                      = local.app_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  service_plan_id           = var.app_service_plan_id
  https_only                = var.https_only
  virtual_network_subnet_id = var.virtual_network_subnet_id
  app_settings              = var.app_settings

  site_config {
    cors {
      allowed_origins     = var.allowed_origins_list
      support_credentials = var.cors_support_credentials
    }
    always_on                   = var.always_on
    ftps_state                  = var.ftps_state
    ip_restriction              = var.ip_restriction
    use_32_bit_worker           = var.use_32_bit_worker
    vnet_route_all_enabled      = var.vnet_route_all_enabled
    health_check_path           = var.health_check_path != null ? var.health_check_path : null
    scm_use_main_ip_restriction = var.scm_use_main_ip_restriction
    app_command_line            = var.app_command_line
    dynamic "application_stack" {
      for_each = var.application_stack == null ? [] : [var.application_stack]
      content {
        dotnet_version = var.application_stack.dotnet_version
      }
    }
  }

  tags = merge(local.default_tags, var.custom_tags)

  dynamic "auth_settings" {
    for_each = local.auth_settings.enabled ? [1] : []
    content {
      enabled                        = local.auth_settings.enabled
      issuer                         = local.auth_settings.issuer
      token_store_enabled            = local.auth_settings.token_store_enabled
      unauthenticated_client_action  = local.auth_settings.unauthenticated_client_action
      default_provider               = local.auth_settings.default_provider
      allowed_external_redirect_urls = local.auth_settings.allowed_external_redirect_urls
      additional_login_parameters    = local.auth_settings.additional_login_params

      dynamic "active_directory" {
        for_each = local.auth_settings_active_directory.client_id == null ? [] : tolist([local.auth_settings_active_directory])
        content {
          client_id     = local.auth_settings_active_directory.client_id
          client_secret = local.auth_settings_active_directory.client_secret
        }
      }
    }
  }
  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_monitor_diagnostic_setting" "web_app" {
  count = var.diagnostic_settings == true ? 1 : 0

  name                           = var.diagnostic_setting_name
  target_resource_id             = azurerm_linux_web_app.azure_web_app.id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id

  enabled_log {
    category = "AppServiceAppLogs"
    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_linux_web_app_slot" "deployment_slots" {
  for_each       = toset(var.deployment_slots)
  name           = each.value
  app_service_id = azurerm_linux_web_app.azure_web_app.id
  app_settings   = var.app_settings

  site_config {
    cors {
      allowed_origins     = var.allowed_origins_list
      support_credentials = var.cors_support_credentials
    }
    always_on                   = var.always_on
    ftps_state                  = var.ftps_state
    ip_restriction              = var.ip_restriction
    use_32_bit_worker           = false
    vnet_route_all_enabled      = var.vnet_route_all_enabled
    health_check_path           = var.health_check_path != null ? var.health_check_path : null
    scm_use_main_ip_restriction = var.scm_use_main_ip_restriction
    app_command_line            = var.app_command_line
    dynamic "application_stack" {
      for_each = var.application_stack == null ? [] : [var.application_stack]
      content {
        dotnet_version = var.application_stack.dotnet_version
      }
    }
  }

  tags = merge(local.default_tags, var.custom_tags)

  auth_settings {
    enabled                        = local.auth_settings.enabled
    issuer                         = local.auth_settings.issuer
    token_store_enabled            = local.auth_settings.token_store_enabled
    unauthenticated_client_action  = local.auth_settings.unauthenticated_client_action
    default_provider               = local.auth_settings.default_provider
    allowed_external_redirect_urls = local.auth_settings.allowed_external_redirect_urls
    additional_login_parameters    = local.auth_settings.additional_login_params

    dynamic "active_directory" {
      for_each = local.auth_settings_active_directory.client_id == null ? [] : tolist([local.auth_settings_active_directory])
      content {
        client_id     = local.auth_settings_active_directory.client_id
        client_secret = local.auth_settings_active_directory.client_secret
      }
    }
  }
  identity {
    type = "SystemAssigned"
  }
}