resource "hcloud_server" "web" {
  name        = "my-server"
   image       = "ubuntu-22.04"
      server_type = "cx11"
      }
