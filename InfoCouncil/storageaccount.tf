resource "azurerm_private_dns_zone" "sa_dns" {
  name                              = var.sa_dns_name
  resource_group_name               = var.rg_name
  tags                              = var.tags  
}

resource "azurerm_private_dns_a_record" "sa_dns_a_record" {
  name                              = var.sa_dns_a_record_name
  zone_name                         = azurerm_private_dns_zone.sa_dns.name
  resource_group_name               = var.rg_name
  ttl                               = 300
  records                           = [azurerm_private_endpoint.sa_pe.private_service_connection.0.private_ip_address]
  depends_on                        = [azurerm_private_endpoint.sa_pe]
  tags                              = var.tags
}

resource "azurerm_private_endpoint" "sa_pe" {
  name                              = var.sa_privateendpoint_name 
  location                          = var.location
  resource_group_name               = var.rg_name
  subnet_id                         = var.subnet4_id
  tags                              = var.tags

  private_service_connection {
    name                            = var.sa_psc_name 
    private_connection_resource_id  = azurerm_storage_account.storageaccount.id
    subresource_names               = ["blob"]
    is_manual_connection            = false
  }

  private_dns_zone_group {
    name                            = var.sa_dzg_name
    private_dns_zone_ids            = [azurerm_private_dns_zone.sa_dns.id]
  }
}

resource "azurerm_storage_account" "storageaccount" {
  name                              = var.sa_name
  location                          = var.location
  resource_group_name               = var.rg_name
  account_tier                      = "Standard"
  account_replication_type          = "LRS"
  enable_https_traffic_only         = true

  network_rules {
    default_action                  = "Deny"
    ip_rules                        = ["121.200.6.246"]
    virtual_network_subnet_ids      = [var.subnet1_id, var.subnet2_id, var.subnet3_id, var.subnet4_id]
  }

  tags                              = var.tags
}