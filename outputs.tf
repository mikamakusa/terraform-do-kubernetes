output "clusters" {
  description = "Informations relatives aux clusters sur digitalocean."
  value = {
    for a in digitalocean_kubernetes_cluster.this : a => {
      id                               = a.id
      ipv4_address                     = a.ipv4_address
      endpoint                         = a.endpoint
      status                           = a.status
      created_at                       = a.created_at
      updated_at                       = a.updated_at
      auto_upgrade                     = a.auto_upgrade
      raw_config                       = sensitive(a.kube_config[0].raw_config)
      host                             = a.kube_config[0].host
      cluster_ca_certificate           = sensitive(a.kube_config[0].cluster_ca_certificate)
      token                            = sensitive(a.kube_config[0].token)
      client_key                       = sensitive(a.kube_config[0].client_key)
      client_certificate               = sensitive(a.kube_config[0].client_certificate)
      expires_at                       = a.kube_config[0].expires_at
      urn                              = a.urn
      ha                               = a.ha
      destroy_all_associated_resources = a.destroy_all_associated_resources
      status                           = a.status
    }
  }
}

output "node_pools" {
  description = "Informations relatives aux node_pools sur digitalocean."
  value = {
    for a in digitalocean_kubernetes_node_pool.this : a => {
      id                = a.id
      actual_node_count = a.actual_node_count
      node_id           = a.nodes[0].id
      node_name         = a.nodes[0].name
      node_status       = a.nodes[0].status
      node_droplet_id   = a.nodes[0].droplet_id
      nodes_created_at  = a.nodes[0].created_at
      nodes_updated_at  = a.nodes[0].updated_at
    }
  }
}
