infra_config = {
  resource_groups = {
    "rg-micro-dev" = {
      location = "mexicocentral"
      tags     = { Environment = "Dev", ManagedBy = "Terraform" }
    }
  }
  container_registries = {
    "acrmicrodev1987" = {
      rg_key = "rg-micro-dev"
      sku    = "Basic"
    }
  }
  kubernetes_clusters = {
    "aks-micro-dev" = {
      rg_key     = "rg-micro-dev"
      dns_prefix = "aksmicrodev"
      acr_key    = "acrmicrodev1987" # Attach the ACR to this AKS cluster
      default_node_pool = {
        name       = "default"
        node_count = 1
        vm_size    = "standard_d2s_v3"
      }
    }
  }
}
