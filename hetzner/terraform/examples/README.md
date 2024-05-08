# Terraform examples for Hetzner

https://community.hetzner.com/tutorials/howto-hcloud-terraform

https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs

## create new project 

Create a new project in Hetzner CLoud (or use existing), create a new RW Token, it should then be exported as a HCLOUD_TOKEN variable.


## rename tf files

only keep one **.tf** file in the folder, as these all are example _standalone_ files for different resources.



##  tf apply

```bash
export HCLOUD_TOKEN=YOURTKN0GU4GkKnP2NT3GKLrDpZ6LAa4QzAcFdSZkcGRVhLm1xr7WHLQpavri8su
```

or 

```bash
tf apply -var="hcloud_token=YOURTKN0GU4GkKnP2NT3GKLrDpZ6LAa4QzAcFdSZkcGRVhLm1xr7WHLQpavri8su"
tf destroy -var="hcloud_token=YOURTKN0GU4GkKnP2NT3GKLrDpZ6LAa4QzAcFdSZkcGRVhLm1xr7WHLQpavri8su"
```
