# ✅ **What is a Terraform provider alias?**

A **provider alias** in Terraform allows you to **configure multiple instances of the same provider**.
This is needed when you want to:

* Deploy to **multiple Azure subscriptions**
* Deploy to **multiple AWS regions/accounts**
* Use different authentication for different resources
* Use different feature flags or settings for the same provider

Terraform normally allows **only one default provider block**, so aliases let you define **additional providers**.

---

# ✅ **Basic Example**

```hcl
provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "westus"
  features        = {}
  subscription_id = "xxxx-xxxx-xxxx"
}
```

* The first provider is the **default**.
* The second provider is an **aliased provider** named `westus`.

---

# ❓ **Why do we use a provider alias?**

Because you may need **different configurations** for the same cloud provider.

Example scenarios:

| Scenario                                | Why alias is needed                                  |
| --------------------------------------- | ---------------------------------------------------- |
| Deploying to 10 subscriptions           | Each subscription needs its own provider block       |
| Creating DR resources in another region | Different regions = multiple providers               |
| Using two different credentials         | SP-1 for Prod, SP-2 for Dev                          |
| Managing global + local resources       | Example: Azure AD + Management Group + Subscriptions |

---

# 🛠️ **How to use an alias inside a resource**

Specify which provider that resource should use:

```hcl
resource "azurerm_storage_account" "example" {
  provider = azurerm.westus
  name                = "storagewestus123"
  resource_group_name = "rg-westus"
  location            = "westus"
  account_tier        = "Standard"
  account_replication_type = "LRS"
}
```

Without this, Terraform will use the **default provider**.

---

# 🔥 **Alias in Modules**

If your module needs to use a specific provider alias, pass it like this:

### **Root module**

```hcl
module "logs" {
  source = "./modules/logs"
  providers = {
    azurerm = azurerm.westus
  }
}
```

### **Child module**

Inside the module, don’t define provider again. Just declare it:

```hcl
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
```

Now the child module uses the aliased provider you passed.

---

# 🧠 **Interview-ready Explanation (Short)**

**“A Terraform provider alias lets you define multiple configurations of the same provider. For example, when deploying Azure resources across multiple subscriptions, each subscription needs its own provider block with an alias. Then resources or modules can reference those using `provider = azurerm.aliasname`. It’s mainly used for multi-region, multi-subscription, or multi-account deployments.”**

---

# 🧠 **Interview-ready Explanation (One-liner)**

**“Provider alias = multiple Terraform provider configurations for the same cloud provider.”**

---
