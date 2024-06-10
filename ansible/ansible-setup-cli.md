# Setting up the ansible server (CLI)


*Feb.2024, Ubuntu22*

## install latest ansible 

**Make sure** you use the ansible repo, **not** the OS one.

https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu


```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

# might need to re-run, due to dpkg error:
sudo apt --fix-broken install


sudo chmod go+w /var/log/ansible.log
mkdir ~/.ansible/
touch ~/.ansible/hosts

```

## add HCLOUD collection

https://github.com/ansible-collections/hetzner.hcloud
https://github.com/ansible-collections/hetzner.hcloud/blob/main/examples/use-refresh-inventory.yml


```
mc:~/ansible-git/ansible$ vi requirements.yaml

mc:~/ansible-git/ansible$ cat requirements.yaml
collections:
  - name: hetzner.hcloud

mc:~/ansible-git/ansible$ ansible-galaxy install -r requirements.yaml
Starting galaxy collection install process
Process install dependency map
Starting collection install process
...
...
hetzner.hcloud (2.5.0) was installed successfully

```


**Verify this manual too:**

**add Ansible Collection: hetzner.hcloud**

https://github.com/ansible-collections/hetzner.hcloud


```
ansible-galaxy collection install hetzner.hcloud
```
or
```
ansible-galaxy collection install hetzner.hcloud:==2.5.0 --force


Installing 'hetzner.hcloud:2.5.0' to '/home/xxx/.ansible/collections/ansible_collections/hetzner/hcloud'
Downloading https://galaxy.ansible.com/api/v3/plugin/ansible/content/published/collections/artifacts/hetzner-hcloud-2.5.0.tar.gz


```



### install hcloud-python module

https://hcloud-python.readthedocs.io/en/stable/installation.html

https://github.com/hetznercloud/hcloud-python


```bash
xxx@rancher-mc:~/ansible-git$ apt install pip
xxx@rancher-mc:~/ansible-git$ git clone git@github.com:hetznercloud/hcloud-python.git
xxx@rancher-mc:~/ansible-git$ sudo pip install ./hcloud-python
```



### updating a collection (on a server and user)

p.s. still looking for a way to add a collection requirement into a playbook.


    muscat@rancher-mc:~/git/ansible$ cat req.yaml
    collections:
      - name: hetzner.hcloud
    
    muscat@rancher-mc:~/git/ansible$ ansible-galaxy install -r req.yaml --force
    Starting galaxy collection install process
    Process install dependency map
    Starting collection install process
    Downloading https://galaxy.ansible.com/api/v3/plugin/ansible/content/published/collections/artifacts/hetzner-hcloud-3.1.1.tar.gz to /root/.ansible/tmp/ansible-local-216638wmp9qlzl/tmpa59pterm/hetzner-hcloud-3.1.1-p983ygtj
    Installing 'hetzner.hcloud:3.1.1' to '/root/.ansible/collections/ansible_collections/hetzner/hcloud'
    hetzner.hcloud:3.1.1 was installed successfully
    
    muscat@rancher-mc:~/git/ansible$ ansible-galaxy collection list |grep hcloud
    hetzner.hcloud                           3.1.1
    hetzner.hcloud                           2.5.0


# see also

https://github.com/smirnov-mi/ansible/edit/main/setup.md

# for AWX setup see

[ansible-setup-awx.md](ansible-setup-awx.md)
