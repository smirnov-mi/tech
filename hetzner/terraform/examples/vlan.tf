data "hcloud_network" "vlan_010" {
  id = "010"
  name = "vlan010"
  with_selector = "vlan=010"
}
