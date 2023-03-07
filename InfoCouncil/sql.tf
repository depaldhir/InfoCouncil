resource "azurerm_private_dns_zone" "ss_dns" {
  name                              = var.ss_dns_name
  resource_group_name               = var.rg_name
  tags                              = var.tags
}

resource "azurerm_private_dns_a_record" "ss_dns_a_record" {
  name                              = var.ss_dns_a_record_name
  zone_name                         = azurerm_private_dns_zone.ss_dns.name
  resource_group_name               = var.rg_name
  ttl                               = 300
  records                           = [azurerm_private_endpoint.ss_pe.private_service_connection.0.private_ip_address]
  depends_on                        = [azurerm_private_endpoint.ss_pe]
  tags                              = var.tags
}

resource "azurerm_private_endpoint" "ss_pe" {
  name                              = var.ss_privateendpoint_name
  resource_group_name               = var.rg_name
  location                          = var.location
  subnet_id                         = var.subnet1_id
  tags                              = var.tags

  private_service_connection {
    name                           = var.ss_psc_name
    private_connection_resource_id = azurerm_mssql_server.sqlserver.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                            = var.ss_dzg_name
    private_dns_zone_ids            = [azurerm_private_dns_zone.ss_dns.id]
  }
}


resource "azurerm_mssql_server" "sqlserver" {
  name                              = var.ss_name
  resource_group_name               = var.rg_name
  location                          = var.location
  version                           = "12.0"
  administrator_login               = "adminuser"
  administrator_login_password      = "password4353&^&*"
  tags                              = var.tags
}

resource "azurerm_mssql_virtual_network_rule" "networkrule" {
  name                              = "sql-vnet-rule"
  server_id                         = azurerm_mssql_server.sqlserver.id
  subnet_id                         = var.subnet1_id
  depends_on                        = [azurerm_mssql_server.sqlserver]
}

resource "azurerm_mssql_elasticpool" "ss_ep" {
  name                              = var.ss_ep_name
  resource_group_name               = var.rg_name
  location                          = var.location
  tags                              = var.tags
  server_name                       = var.ss_name
  # license_type                      = "LicenseIncluded"
  max_size_gb                       = 4.8828125

  sku {
    name                            = "BasicPool"
    tier                            = "Basic"
    capacity                        = 50
  }

  per_database_settings {
    min_capacity                    = 0
    max_capacity                    = 5
  }
  depends_on = [azurerm_mssql_server.sqlserver]
}