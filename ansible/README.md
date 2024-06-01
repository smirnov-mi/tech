# ANSIBLE things

## AWX

Free and opensource Ansible Tower (AAP2) powered by RedHat


## see installing k3s

[../k3s/README.md](../k3s/README.md)


## install AWX 

as a helm chart

https://ansible.readthedocs.io/projects/awx-operator/en/latest/installation/helm-install-on-existing-cluster.html

```bash
helm repo add awx-operator https://awx-helm-charts.github.io/awx-operator
helm repo update
helm install awx-operator awx-operator/awx-operator
```

...

