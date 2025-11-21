client_id       = "xxxxx-xxxx-..."
client_secret   = "supersecret"
common_tenant_id = "yyyyy-yyyy-..."

subscriptions = {
  sub1 = {
    subscription_id = "11111111-1111-1111-1111-111111111111"
    location        = "eastus"
    resource_group  = "rg-storage-sub1"
    storage_name    = "mystorageacctsub1"
  }
  sub2 = {
    subscription_id = "22222222-2222-2222-2222-222222222222"
    location        = "westus2"
    resource_group  = "rg-storage-sub2"
    storage_name    = "mystorageacctsub2"
  }
  sub3 = {
    subscription_id = "33333333-3333-3333-3333-333333333333"
    location        = "centralindia"
    resource_group  = "rg-storage-sub3"
    storage_name    = "mystorageacctsub3"
  }
}
