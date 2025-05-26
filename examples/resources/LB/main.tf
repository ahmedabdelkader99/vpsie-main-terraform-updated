terraform {
  required_providers {
   vpsie = {
      source = "registry.terraform.local/hashicorp/vpsie"
      version = "0.1.0"    
      }
  }
}

provider "vpsie" {
}

resource "vpsie_loadbalancer" "example" {
  #resource_identifier = "lbalancerwithoutrules"
  dc_id           = "55f06b85-c9ee-11e3-9845-005056aa8af7"
  lb_name         = "lb-lax-lbalancerwithoutrules"
  algorithm       = "roundrobin"
  redirect_http   = 1
  cookie_check    = 1
  cookie_name     = "test1"
  traffic  = 2000
  boxsize_id = 2
# Optional, empty rules array
#   rules = []
}

output "loadbalancer_test" {
  value = vpsie_loadbalancer.example
}