data "azurerm_linux_web_app" "az204webapp5454" {
  name                = "existing"
  resource_group_name = "az204webapp5454_group"
}

output "id" {
  value = data.azurerm_linux_web_app.example.id
}
