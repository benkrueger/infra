terraform {

    required_providers {

        vultr = {
            source = "vultr/vultr"
            version = ">= 2.10.1"
        }
        cloudflare = {
            source  = "cloudflare/cloudflare"
            version = "~> 4.0"
        }

    }

}

provider "vultr" {
    api_key = var.VULTR_API_KEY
}
provider "cloudflare" {
    api_token = var.cloudflare_api_token
}
variable "VULTR_API_KEY" {}
variable "cloudflare_api_token" {}
/*
resource "vultr_ssh_key" "my_key" {
  name = "My SSH Key"
  ssh_key = file("~/.ssh/id_rsa.pub")
}
*/
resource "vultr_instance" "cloudgw" {
    plan = "vc2-1c-1gb"
    region = "ord"
    os_id = 1743
    label = "cloudgw"
    tags = ["cloudgw"]
    hostname = "cloudgw"
    enable_ipv6 = true
    backups = "enabled"
    backups_schedule {
            type = "weekly"
    }
    ddos_protection = false
    activation_email = true
    //ssh_key_ids = [vultr_ssh_key.my_key.id] 
}

resource "cloudflare_record" "cloud_gateway_a" {
  zone_id = "4637700cabe8a9ecba29c4eeb71e14b7"
  name    = "terraform_A"
  value   = vultr_instance.cloudgw.main_ip
  type    = "A"
  ttl     = 3600
}
resource "cloudflare_record" "cloud_gateway_aaaa" {
  zone_id = "4637700cabe8a9ecba29c4eeb71e14b7"
  name    = "terraform_AAAA"
  value   = vultr_instance.cloudgw.v6_main_ip
  type    = "AAAA"
  ttl     = 3600
}