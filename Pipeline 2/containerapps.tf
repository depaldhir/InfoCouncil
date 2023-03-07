# resource "azurerm_container_app" "example" {
#   name                              = "example-app"
#   container_app_environment_id      = azurerm_container_app_environment.cae.id
#   resource_group_name               = var.rg_name
#   tags                              = var.tags
#   revision_mode                     = "Single"

#   template {
#     container {
#       name                          = "examplecontainerapp"
#       image                         = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
#       cpu                           = 0.25
#       memory                        = "0.5Gi"
#     }
#   }
# }