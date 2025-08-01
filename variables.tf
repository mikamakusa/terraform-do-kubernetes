variable "clusters" {
  type = list(object({
    name                             = string
    region                           = string
    version                          = string
    cluster_subnet                   = optional(string)
    service_subnet                   = optional(string)
    vpc_uuid                         = optional(string)
    auto_upgrade                     = optional(bool)
    surge_upgrade                    = optional(bool)
    ha                               = optional(bool)
    registry_integration             = optional(bool)
    tags                             = optional(set(string))
    destroy_all_associated_resources = optional(bool)
    node_pools = optional(list(object({
      name       = string
      size       = string
      node_count = optional(number)
      max_nodes  = optional(number)
      min_nodes  = optional(number)
      auto_scale = optional(bool)
      tags       = optional(set(string))
      labels     = optional(map(string))
      taint = optional(list(object({
        effect = string
        key    = string
        value  = string
      })))
    })))
  }))
}

variable "maintenance_policies" {
  type = list(object({
    day        = optional(string)
    start_time = optional(string)
  }))
  default = []
}

variable "node_pools" {
  type = list(object({
    name       = string
    size       = string
    node_count = optional(number)
    auto_scale = optional(bool)
    min_nodes  = optional(number)
    max_nodes  = optional(number)
    tags       = optional(set(string))
    labels     = optional(map(string))
  }))
}