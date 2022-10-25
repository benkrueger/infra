# infra
My infrastructure projects

## What this is
This is all the infrastructure as code I use in my homelab/projects/cloud setups. The vast majority of these 
scripts/playbooks/etc will be centered around debian based linux distros.

## How it is organized
Each branch of this repo is a different host. To deploy to a host I switch to the relevant branch and run the code.
The main branch is literally just this readme, maybe some shared code if that becomes possible.

## NAS 

This branch has my NAS setup and services. Target os is Ubuntu server 20.04. 

### Installs on base os:
- ansible
- ZFS on linux
- docker
- docker-compose
- fail2ban
- tailscale
- python3 (and pip3)
- Browsers, editors, and desktop env configs I like
