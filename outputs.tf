output "id" {
  description = "Web app ID."
  value       = azurerm_linux_web_app.azure_web_app.id
}

output "name" {
  description = "Web app name."
  value       = azurerm_linux_web_app.azure_web_app.name
}

output "principal_ids" {
  value = merge(
    { for identity in azurerm_linux_web_app.azure_web_app.identity : azurerm_linux_web_app.azure_web_app.name => identity },
    { for slot in azurerm_linux_web_app_slot.deployment_slots : slot.name => slot.identity[0] }
  )
}

output "default_hostname" {
  value       = azurerm_linux_web_app.azure_web_app.default_hostname
  description = "The default hostname associated with the Web App - such as mysite.azurewebsites.net"
}

output "outbound_ip_addresses" {
  description = "Outbound IP addresses of the Web App"
  value       = azurerm_linux_web_app.azure_web_app.outbound_ip_addresses
}

output "possible_outbound_ip_addresses" {
  description = "Possible outbound IP addresses of the Web App"
  value       = azurerm_linux_web_app.azure_web_app.possible_outbound_ip_addresses
}