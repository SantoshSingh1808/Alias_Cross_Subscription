resource "azurerm_resource_group" "rg" {
 name = "Ketu-rg"
 location = "central India"
 provider = azurerm.Ketu
 } 

resource "azurerm_resource_group" "rg1" {
 name = "Rahu-rg"
 location = "central India"
 provider = azurerm.Rahu
 } 