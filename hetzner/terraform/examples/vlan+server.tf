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

resource "hcloud_network_subnet" "subnet-2" {
  network_id   = hcloud_network.mynet.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.2.0/24"
}

resource "hcloud_server_network" "srvnetwork" {
  server_id  = hcloud_server.server-1.id
  network_id = hcloud_network.mynet.id
  ip         = "10.0.2.4"
}

resource "hcloud_server" "server-1" {
  name        = "server-1"
  image       = "debian-11"
  server_type = "cx11"
  depends_on = [
    hcloud_network_subnet.subnet-2
  ]
}



resource "hcloud_server" "server-2" {
  name        = "server-2"
  server_type = "cx11"
  image       = "ubuntu-20.04"
  location    = "nbg1"

  network {
    network_id = hcloud_network.mynet.id
    ip         = "10.0.1.5"
    #alias_ips  = [
    #  "10.0.1.6",
    #  "10.0.1.7"
    #]
  }
  depends_on = [
    hcloud_network_subnet.subnet-1
  ]
}


# Server with a volume atached

resource "hcloud_server" "server-3" {
  name        = "server-3"
  server_type = "cx11"
  image       = "ubuntu-24.04"
  location    = "nbg1"

  network {
    network_id = hcloud_network.mynet.id
    ip         = "10.0.1.8"
    #alias_ips  = [
    #  "10.0.1.9",
    #  "10.0.1.10"
    #]
  }

  # **Note**: the depends_on is important when directly attaching the
  # server to a network. Otherwise Terraform will attempt to create
  # server and sub-network in parallel. This may result in the server
  # creation failing randomly.
  depends_on = [
    hcloud_network_subnet.subnet-1
  ]
}

resource "hcloud_volume" "vol3-1" {
  name      = "volume3-1"
  size      = 50
  server_id = hcloud_server.server-3.id
  automount = true
  format    = "ext4"
}

resource "hcloud_volume_attachment" "main" {
  volume_id = hcloud_volume.vol3-1.id
  server_id = hcloud_server.server-3.id
  automount = true
}
