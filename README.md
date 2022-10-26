# infra
My infrastructure projects

## What this is
This is all the infrastructure as code I use in my homelab/projects/cloud setups. The vast majority of these 
scripts/playbooks/etc will be centered around debian based linux distros.

## How it is organized
Each branch of this repo is a different host. To deploy to a host I switch to the relevant branch and run the code.
The main branch is literally just this readme, maybe some shared code if that becomes possible.

## Laptop

This branch has my laptop setup and services. Target os is Regolith LInux 1.6.0-focal. 

### Installs on base os:
- ansible
- ZFS on linux
- docker
- docker-compose
- fail2ban
- tailscale
- python3 (and pip3)
- Security tools and hardening I like
- Cron jobs I use
- Browsers, editors, and desktop env configs I like
