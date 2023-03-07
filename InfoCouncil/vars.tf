variable "rg_name" {}
variable "location" {}
variable "tenant_id" {}

# variable "vnet_name" {}
# variable "vnet_space" {}

variable "subnet1_id" {}
variable "subnet2_id" {}
variable "subnet3_id" {}
variable "subnet4_id" {}

# variable "nsg1_name" {}
# variable "nsg2_name" {}
# variable "nsg3_name" {}
# variable "nsg4_name" {}

variable "tags" {}

#Variables for Storage Account
# variable "account_replication_type" {}
# variable "sa_name" {}
# variable "account_kind" {}
# variable "account_tier" {}
# variable "access_tier" {}
# variable "min_tls_version" {}

#Variables for Container Registry
variable "container_registry_name" {}

#Variables for SQL Server
variable "ss_dns_name" {}
variable "ss_dns_a_record_name" {}
variable "ss_privateendpoint_name" {}
variable "ss_psc_name" {}
variable "ss_dzg_name" {}
variable "ss_name" {}
variable "ss_ep_name" {}

#Variables for Keyvault
variable "kv_dns_name" {}
variable "kv_dns_a_record_name" {}
variable "kv_privateendpoint_name" {}
variable "kv_psc_name" {}
variable "kv_dzg_name" {}
variable "kv_name" {}
variable "kv_sku_name" {}

#Variables for Storage Account
variable "sa_dns_name" {}
variable "sa_dns_a_record_name" {}
variable "sa_privateendpoint_name" {}
variable "sa_psc_name" {}
variable "sa_dzg_name" {}
variable "sa_name" {}

#Variables for Container App Environment (CAE)
variable "cae_dns_name" {}
variable "cae_dns_a_record_name" {}
variable "cae_name" {}
variable "aw_name" {}
