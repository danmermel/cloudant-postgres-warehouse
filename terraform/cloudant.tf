resource "ibm_resource_instance" "cloudant" {
  name              = "test-ecommerce"
  service           = "cloudantnosqldb"
  plan              = "standard"
  location          = "eu-gb"
}

resource "ibm_resource_key" "cloudant_credentials" {
  name                  = "my-db-key"
  role                  = "Manager"
  resource_instance_id  = ibm_resource_instance.cloudant.id
}

output "cloudant_credentials" {
  value = ibm_resource_key.cloudant_credentials.credentials
  sensitive = true
}

