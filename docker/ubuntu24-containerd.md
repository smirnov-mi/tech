# Setup containerd on Ubuntu 24.04 

see https://github.com/containerd/containerd/blob/main/docs/getting-started.md

## Set up Docker's apt repository.

### Add Docker's official GPG key:

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

### Add the repository to Apt sources:

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

### install containerd

    apt install containerd.io
    systemctl start containerd
    systemctl enable containerd

### configure SystemdCgroup

    mv /etc/containerd/config.toml /etc/containerd/config.toml.orig
    containerd config default | sudo tee /etc/containerd/config.toml
    sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml




## FIND THE LATEST CNI: https://github.com/containernetworking/plugins/releases

    curl -s https://api.github.com/repos/containernetworking/plugins/releases/latest | jq -r '.tag_name'
    
    wget https://github.com/containernetworking/plugins/releases/download/v1.5.0/cni-plugins-linux-amd64-v1.5.0.tgz
    mkdir -p /opt/cni/bin
    tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v1.5.0.tgz
    systemctl restart containerd


## FIND THE LATEST NerdCTL: https://github.com/containerd/nerdctl/releases

    curl -s https://api.github.com/repos/containerd/nerdctl/releases/latest | jq -r '.tag_name'
    wget https://github.com/containerd/nerdctl/releases/download/v1.7.6/nerdctl-1.7.6-linux-amd64.tar.gz
    sudo tar Cxzvf /usr/local/bin nerdctl-1.7.6-linux-amd64.tar.gz



## TEST it all with:

    sudo nerdctl run -d --name nginx -p 80:80 nginx:alpine

