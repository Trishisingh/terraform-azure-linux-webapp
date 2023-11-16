locals {
  app_name     = var.app_name
  default_tags = var.tags

  auth_settings = merge(
    {
      enabled                        = false
      issuer                         = format("https://sts.windows.net/%s/", data.azurerm_client_config.main.tenant_id)
      token_store_enabled            = false
      unauthenticated_client_action  = "RedirectToLoginPage"
      default_provider               = "AzureActiveDirectory"
      allowed_external_redirect_urls = []
      additional_login_params        = {}
      active_directory               = null
    },
  var.auth_settings)

  auth_settings_ad_default = {
    client_id         = null
    client_secret     = null
    allowed_audiences = []
  }

  auth_settings_active_directory = merge(
    {
      client_id         = null
      client_secret     = null
      allowed_audiences = []
    },
  local.auth_settings.active_directory == null ? local.auth_settings_ad_default : var.auth_settings.active_directory)
}
