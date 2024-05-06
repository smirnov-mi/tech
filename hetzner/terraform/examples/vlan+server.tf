resource "hcloud_network" "mynet" {
  name     = "my-net"
  ip_range = "10.0.0.0/8"
}
resource "hcloud_network_subnet" "foonet" {
  network_id   = hcloud_network.mynet.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.2.0/24"
}

resource "hcloud_server_network" "srvnetwork" {
  server_id  = hcloud_server.node1.id
  network_id = hcloud_network.mynet.id
  ip         = "10.0.2.5"
}
resource "hcloud_server_network" "srvnetwork" {
  server_id  = hcloud_server.node2.id
  network_id = hcloud_network.mynet.id
  ip         = "10.0.2.6"
}

resource "hcloud_server" "node1" {
  name        = "node1"
  image       = "debian-11"
  server_type = "cx11"
}
resource "hcloud_server" "node2" {
  name        = "node2"
  image       = "debian-11"
  server_type = "cx11"
}
