provider "digitalocean" {}

module "clusters" {
  source = "../../"
  clusters = [
    {
      name    = "foo"
      region  = "nyc1"
      version = "latest"
    }
  ]
  node_pools = [
    {
      name       = "worker-pool"
      size       = "s-2vcpu-2gb"
      node_count = 3
    }
  ]
}