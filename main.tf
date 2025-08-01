resource "digitalocean_kubernetes_cluster" "this" {
  for_each                         = { for cluster in var.clusters : cluster.name => cluster }
  name                             = each.value.name
  region                           = each.value.region
  version                          = each.value.version
  cluster_subnet                   = each.value.cluster_subnet
  service_subnet                   = each.value.service_subnet
  vpc_uuid                         = each.value.vpc_uuid
  auto_upgrade                     = each.value.auto_upgrade
  surge_upgrade                    = each.value.surge_upgrade
  ha                               = each.value.ha
  registry_integration             = each.value.registry_integration
  tags                             = each.value.tags
  destroy_all_associated_resources = each.value.destroy_all_associated_resources

  dynamic "maintenance_policy" {
    for_each = { for policy in var.maintenance_policies : policy.day => policy }
    iterator = mp
    content {
      day        = lookup(mp.value, "day")
      start_time = lookup(mp.value, "start_time")
    }
  }

  dynamic "node_pool" {
    for_each = { for pool in var.node_pools : pool.name => pool }
    content {
      name       = lookup(node_pool.value, "name")
      size       = lookup(node_pool.value, "size")
      node_count = lookup(node_pool.value, "node_count")
      auto_scale = lookup(node_pool.value, "auto_scale")
      min_nodes  = lookup(node_pool.value, "min_nodes")
      max_nodes  = lookup(node_pool.value, "max_nodes")
      tags       = lookup(node_pool.value, "tags")
      labels     = lookup(node_pool.value, "labels")
    }
  }
}

resource "digitalocean_kubernetes_node_pool" "this" {
  for_each   = { for cluster in var.clusters : cluster.name => cluster if contains(keys(cluster), "node_pools") && cluster.node_pools != null }
  cluster_id = digitalocean_kubernetes_cluster.this[each.key].id
  name       = lookup(each.value, "name")
  size       = lookup(each.value, "size")
  node_count = lookup(each.value, "node_count")
  max_nodes  = lookup(each.value, "max_nodes")
  min_nodes  = lookup(each.value, "min_nodes")
  auto_scale = lookup(each.value, "auto_scale")
  tags       = lookup(each.value, "tags")
  labels     = lookup(each.value, "labels")

  dynamic "taint" {
    for_each = { for cluster in var.clusters.*.node_pools : cluster.name => cluster if contains(keys(cluster), "taint") && cluster.taint != null }
    content {
      effect = lookup(taint.value, "effect")
      key    = lookup(taint.value, "key")
      value  = lookup(taint.value, "value")
    }
  }
}