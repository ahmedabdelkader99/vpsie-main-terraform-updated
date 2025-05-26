terraform {
  required_providers {
    vpsie = {
      source  = "registry.terraform.local/hashicorp/vpsie"
      version = "0.1.0"
    }
  }
}

provider "vpsie" {}

resource "vpsie_firewall" "firewall_01" {
  # Optional metadata
  group_name      = "Firewall-terraform"
#   create_from_pool = false  # createFromPool: "0"

  rules {
        in_bound {
        action  = "ACCEPT"
        proto   = "tcp"
        dport   = "22"
        source  = ["0.0.0.0/0", "::0/0"]
        dest    = ["0.0.0.0/0", "::0/0"]
        enable  = 1
        macro   = "ssh"
            }

  }

#   vm_identifier = null  # No VM directly associated
}
