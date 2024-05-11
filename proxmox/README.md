# Proxmox

https://pve.proxmox.com/

4.2024 - v8.1
5.2024 - v8.2

## setup

### Install on Hetzner VM 

For test purpose - OK
    
    install debian
    ask support to upload the current Proxmox ISO image, we have 8.1 now,
    boot the VM from that image and install Proxmox
    the root PW will be that from the previous debian installation


### Standalone installation 

network speed issues - disable Datacenter Firewall in pve


see also https://github.com/smirnov-mi/how-to/tree/main/proxmox


having locale warnings, add foll. into /etc/default/locale file:
```
LANG="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
```


## System Update / Upgrades

IF running a cluser, free up the node first,
only upgrade one node at a time. Use **dist-upgrade**, not upgrade.

	apt update
	apt dist-upgrade
	systemctl reboot 



## Ubuntu VM

[ubuntu-image.md](ubuntu-image.md)


## Windows VM

[windows-image.md](windows-image.md)


## Terraform

see [terraform.md](terraform.md)




## Rancher driver (TODO)

https://github.com/cuza/rancher-ui-driver-proxmoxve

https://github.com/lnxbil/docker-machine-driver-proxmox-ve




## HA / Cluster 

3 nodes (odd number) required to build a quorum for cluster, regardless of HA or not

https://youtu.be/08b9DDJ_yf4?si=94nwelC6EPaOZ17h

https://www.youtube.com/watch?v=FQIdhX0xSoQ (DE)

