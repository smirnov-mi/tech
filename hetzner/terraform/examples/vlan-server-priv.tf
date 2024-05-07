resource "hcloud_network" "mynet" {
  name     = "my-net"
  ip_range = "10.0.0.0/16"
}


resource "hcloud_network_subnet" "subnet-1" {
  network_id   = hcloud_network.mynet.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

# this is the server that should be connected to the network
#resource "hcloud_server_network" "srvnetwork1" {
#  server_id  = hcloud_server.server-8.id
#  network_id = hcloud_network.mynet.id
#  ip         = "10.0.1.4"
#}

resource "hcloud_ssh_key" "default" {
  name       = "access1"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "hcloud_server" "server-8" {
  name        = "server-8"
  image       = "debian-11"
  server_type = "cx11"
  location    = "nbg1"
  ssh_keys    = ["access1"]
  network {
    network_id = hcloud_network.mynet.id
    ip         = "10.0.1.8"
  }
  labels = {
    "test" : "test"
  }
  public_net {
    ipv4_enabled = false
    #ipv4 = hcloud_primary_ip.primary_ip_1.id
    ipv6_enabled = false
  }
  depends_on = [
    hcloud_network_subnet.subnet-1
  ]
}
