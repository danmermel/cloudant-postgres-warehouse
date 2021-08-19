resource "ibm_database" "postgresdb" {
  resource_group_id                    = ibm_resource_group.resourceGroup.id
  name                                 = "test-data-warehouse"
  service                              = "databases-for-postgresql"
  plan                                 = "standard"
  location                             = "eu-gb"
  tags                                 = []
  adminpassword = var.postgres_password
}


output "postgres_credentials" {
  value = ibm_database.postgresdb.connectionstrings
  sensitive = true
}