resource "azurerm_resource_group" "testdevopsrg" {
  name     = "${var.testdevopsrg}"
  location = "${var.location}"
}

resource "azurerm_resource_group" "testaksrg" {
  name     = "${var.aksrg}"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "testvnet" {
  name                = "${var.testvnet}"
  address_space       = ["10.0.0.0/15"]
  dns_servers         = "${var.dns_servers}"
  location            = "${azurerm_resource_group.testdevopsrg.location}"
  resource_group_name = "${azurerm_resource_group.testdevopsrg.name}"
}

resource "azurerm_subnet" "testsubnet" {
  name                 = "${var.testsubnet}"
  resource_group_name  = "${azurerm_resource_group.testdevopsrg.name}"
  virtual_network_name = "${azurerm_virtual_network.testvnet.name}"
  address_prefix       = "${var.testaddress_subnet}"
  // network_security_group_id = "${azurerm_network_security_group.aks-nsg.id}"
  // service_endpoints    = ["Microsoft.Sql"]
}


// resource "azurerm_resource_group" "corerg" {
//   name     = "rg-gw-core-01"
//   location = "UK South"
// }




