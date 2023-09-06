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
}
resource "cloudflare_record" "singleArecord" {
  zone_id = var.cloudflare_zone_id
  name    = "terraform_A"
  value   = vultr_instance.main_ip
  type    = "A"
  ttl     = 3600
}
resource "cloudflare_record" "quadArecord" {
  zone_id = var.cloudflare_zone_id
  name    = "terraform_AAAA"
  value   = vultr_instance.v6_main_ip
  type    = "AAAA"
  ttl     = 3600
}