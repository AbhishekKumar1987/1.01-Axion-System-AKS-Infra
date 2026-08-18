output "aks_ids" {
  value = { for k, v in azurerm_kubernetes_cluster.aks : k => v.id }
}

output "aks_kube_configs" {
  value     = { for k, v in azurerm_kubernetes_cluster.aks : k => v.kube_config_raw }
  sensitive = true
}

output "aks_kubelet_identities" {
  value = { for k, v in azurerm_kubernetes_cluster.aks : k => v.kubelet_identity[0].object_id }
}

output "aks_principal_ids" {
  value = { for k, v in azurerm_kubernetes_cluster.aks : k => v.identity[0].principal_id }
}
