resource "oci_core_virtual_network" "OCI_ES_VCN" {
  cidr_block     = var.VCN-CIDR
  compartment_id = var.compartment_ocid
  display_name   = var.OCI_ES_VCN
  dns_label      = var.OCIESVCN
}


resource "oci_core_subnet" "LBSubnetAD1" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0]["name"]
  cidr_block          = var.LBSubnetAD1CIDR
  display_name        = var.LBSubnetAD1
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.OCI_ES_VCN.id
#  route_table_id      = oci_core_route_table.OCI_PUB_RTB.id
#  security_list_ids   = [oci_core_security_list.LBSecList.id]
  dhcp_options_id     = oci_core_virtual_network.OCI_ES_VCN.default_dhcp_options_id
  dns_label           = var.lbad1
}

resource "oci_core_subnet" "LBSubnetAD2" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[1]["name"]
  cidr_block          = var.LBSubnetAD2CIDR
  display_name        = var.LBSubnetAD2
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.OCI_ES_VCN.id
#  route_table_id      = oci_core_route_table.OCI_PUB_RTB.id
#  security_list_ids   = [oci_core_security_list.LBSecList.id]
  dhcp_options_id     = oci_core_virtual_network.OCI_ES_VCN.default_dhcp_options_id
  dns_label           = var.lbad2
}

resource "oci_core_subnet" "PrivSubnetAD1" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0]["name"]
  cidr_block          = var.PrivSubnetAD1CIDR
  display_name        = var.PrivateSubnetAD1
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.OCI_ES_VCN.id
#  route_table_id      = oci_core_route_table.OCI_PVT_RTB.id
#  security_list_ids   = [oci_core_security_list.PrivSecList.id]
  dhcp_options_id     = oci_core_virtual_network.OCI_ES_VCN.default_dhcp_options_id

  #prohibit_public_ip_on_vnic  = "true"
  dns_label = var.privad1
}

resource "oci_core_subnet" "PrivSubnetAD2" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[1]["name"]
  cidr_block          = var.PrivSubnetAD2CIDR
  display_name        = "PrivateSubnetAD2"
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.OCI_ES_VCN.id
#  route_table_id      = oci_core_route_table.OCI_PVT_RTB.id
#  security_list_ids   = [oci_core_security_list.PrivSecList.id]
  dhcp_options_id     = oci_core_virtual_network.OCI_ES_VCN.default_dhcp_options_id

  #prohibit_public_ip_on_vnic  = "true"
  dns_label = var.privad2
}

resource "oci_core_subnet" "PrivSubnetAD3" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[2]["name"]
  cidr_block          = var.PrivSubnetAD3CIDR
  display_name        = "PrivateSubnetAD3"
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.OCI_ES_VCN.id
 # route_table_id      = oci_core_route_table.OCI_PVT_RTB.id
 # security_list_ids   = [oci_core_security_list.PrivSecList.id]
  dhcp_options_id     = oci_core_virtual_network.OCI_ES_VCN.default_dhcp_options_id

  #prohibit_public_ip_on_vnic  = "true"
  dns_label = var.privad3
}

