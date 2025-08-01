## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.62.0 |

## Modules

No modules.

## Usages

- [clusters](examples/clusters/main.tf)
- [node_pools](examples/node_pools/main.tf)

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_cluster.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_kubernetes_node_pool.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clusters"></a> [clusters](#input\_clusters) | n/a | <pre>list(object({<br/>    name                             = string<br/>    region                           = string<br/>    version                          = string<br/>    cluster_subnet                   = optional(string)<br/>    service_subnet                   = optional(string)<br/>    vpc_uuid                         = optional(string)<br/>    auto_upgrade                     = optional(bool)<br/>    surge_upgrade                    = optional(bool)<br/>    ha                               = optional(bool)<br/>    registry_integration             = optional(bool)<br/>    tags                             = optional(set(string))<br/>    destroy_all_associated_resources = optional(bool)<br/>    node_pools = optional(list(object({<br/>      name       = string<br/>      size       = string<br/>      node_count = optional(number)<br/>      max_nodes  = optional(number)<br/>      min_nodes  = optional(number)<br/>      auto_scale = optional(bool)<br/>      tags       = optional(set(string))<br/>      labels     = optional(map(string))<br/>      taint = optional(list(object({<br/>        effect = string<br/>        key    = string<br/>        value  = string<br/>      })))<br/>    })))<br/>  }))</pre> | n/a | yes |
| <a name="input_maintenance_policies"></a> [maintenance\_policies](#input\_maintenance\_policies) | n/a | <pre>list(object({<br/>    day        = optional(string)<br/>    start_time = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | n/a | <pre>list(object({<br/>    name       = string<br/>    size       = string<br/>    node_count = optional(number)<br/>    auto_scale = optional(bool)<br/>    min_nodes  = optional(number)<br/>    max_nodes  = optional(number)<br/>    tags       = optional(set(string))<br/>    labels     = optional(map(string))<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clusters"></a> [clusters](#output\_clusters) | Informations relatives aux clusters sur digitalocean. |
| <a name="output_node_pools"></a> [node\_pools](#output\_node\_pools) | Informations relatives aux node\_pools sur digitalocean. |
