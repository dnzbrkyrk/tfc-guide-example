data "azurerm_linux_web_app" "az204webapp5454" {
  name                = "az204webapp5454"
  resource_group_name = "az204webapp5454_group"
}

output "id" {
  value = data.azurerm_linux_web_app.az204webapp5454.id
}

resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "random_string" "container_name" {
  length  = 25
  lower   = true
  upper   = false
  special = false
}

resource "azurerm_container_group" "container" {
  name                = "${var.container_group_name_prefix}-${random_string.container_name.result}"
  location            = var.resource_group_location
  resource_group_name = "az204webapp5454_group"
  ip_address_type     = "Public"
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  zones               = var.zone != "" ? [ var.zone ] : null

  container {
    name   = "${var.container_name_prefix}-${random_string.container_name.result}"
    image  = var.image
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }
}

resource "azurerm_linux_function_app" "example" {
  name                = "az204denizooo-funcapp"
  resource_group_name = "func-app-res-group"
  location            = var.resource_group_location

  storage_account_name       = "funcappresgroupb31d"
  service_plan_id            = "/subscriptions/d08931ba-8ce2-42bd-a7a0-f314a8ad890d/resourceGroups/func-app-res-group/providers/Microsoft.Web/serverFarms/ASP-funcappresgroup-a8b5"

  site_config {}
}
