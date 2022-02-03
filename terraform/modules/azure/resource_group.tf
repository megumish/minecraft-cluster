resource "random_id" "rg" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    project_name = "${var.project_name}"
  }

  byte_length = 8
}

resource "azurerm_resource_group" "rg" {
  name     = "${random_id.rg.keepers.project_name}-${random_id.rg.hex}"
  location = var.project_location
}
