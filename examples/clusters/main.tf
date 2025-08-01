provider "digitalocean" {}

module "clusters" {
  source = "../../"
  clusters = [
    {
      name    = "foo"
      region  = "nyc1"
      version = "latest"
      node_pools = [
        {
          name       = "backend-pool"
          size       = "c-2"
          node_count = 2
          tags       = ["backend"]
          taint = [
            {
              key    = "workloadKind"
              value  = "database"
              effect = "NoSchedule"
            }
          ]
        },
        {
          name       = "frontend-pool"
          size       = "c-2"
          node_count = 3
          tags       = ["frontend"]
          taint = [
            {
              key    = "workloadKind"
              value  = "database"
              effect = "NoSchedule"
            }
          ]
        }
      ]
    }
  ]
  node_pools = [
    {
      name       = "worker-pool"
      size       = "s-2vcpu-2gb"
      node_count = 2
    }
  ]
}