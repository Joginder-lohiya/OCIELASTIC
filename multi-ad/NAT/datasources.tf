# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

# Gets a list of vNIC attachments on the bastion host
#data "oci_core_vnic_attachments" "BastionVnics" {
#  compartment_id      = var.compartment_ocid
#  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[2]["name"]
#  instance_id         = oci_core_instance.BastionHost.id
#}

# Gets the OCID of the first vNIC on the bastion host
#data "oci_core_vnic" "BastionVnic" {
#  vnic_id = data.oci_core_vnic_attachments.BastionVnics.vnic_attachments[0]["vnic_id"]
#}

# Get the Private of bastion host
#data "oci_core_private_ips" "BastionPrivateIPs" {
#  ip_address = data.oci_core_vnic.BastionVnic.private_ip_address
#  subnet_id  = oci_core_subnet.BastionSubnetAD3.id
#}
data "oci_identity_compartments" "ELASTIC" {
        compartment_id = var.tenancy_ocid
  filter {
      name = "name"
      values = ["ELASTIC"]
  }
}

data "oci_core_vcns" "OCI_ES_VCN" {
  compartment_id = "${lookup(data.oci_identity_compartments.ELASTIC.compartments[0],"id")}"
#        display_name = "OCI_ES_VCN"
        state = "AVAILABLE"
		filter {
      name = "display_name"
      values = ["OCI_ES_VCN"]
      regex = true
  }
}

#data "oci_core_vcns" "OCI_ES_VCN" {
#  compartment_id = "${lookup(data.oci_identity_compartments.ELASTIC.compartments[0],"id")}"
#  compartment_id = var.compartment_ocid
#        display_name = "OCI_ES_VCN"
#        state = "AVAILABLE"
#}

data "oci_core_subnets" "SubNet-PrivateSubnetAD3-AD3" {
        compartment_id = "${lookup(data.oci_identity_compartments.ELASTIC.compartments[0],"id")}"
  vcn_id = "${lookup(data.oci_core_vcns.OCI_ES_VCN.virtual_networks[0],"id")}"
  state = "AVAILABLE"
  filter {
      name = "display_name"
      values = ["PrivateSubnetAD3"]
      regex = true
  }
}

data "oci_core_subnets" "SubNet-PrivateSubnetAD1-AD1" {
        compartment_id = "${lookup(data.oci_identity_compartments.ELASTIC.compartments[0],"id")}"
  vcn_id = "${lookup(data.oci_core_vcns.OCI_ES_VCN.virtual_networks[0],"id")}"
  state = "AVAILABLE"
  filter {
      name = "display_name"
      values = ["PrivateSubnetAD1"]
      regex = true
  }
}

data "oci_core_subnets" "SubNet-LBSubnetAD2-AD2" {
        compartment_id = "${lookup(data.oci_identity_compartments.ELASTIC.compartments[0],"id")}"
  vcn_id = "${lookup(data.oci_core_vcns.OCI_ES_VCN.virtual_networks[0],"id")}"
  state = "AVAILABLE"
  filter {
      name = "display_name"
      values = ["LBSubnetAD2"]
      regex = true
  }
}

data "oci_core_subnets" "SubNet-LBSubnetAD1-AD1" {
        compartment_id = "${lookup(data.oci_identity_compartments.ELASTIC.compartments[0],"id")}"
  vcn_id = "${lookup(data.oci_core_vcns.OCI_ES_VCN.virtual_networks[0],"id")}"
  state = "AVAILABLE"
  filter {
      name = "display_name"
      values = ["LBSubnetAD1"]
      regex = true
  }
}

data "oci_core_subnets" "SubNet-PrivateSubnetAD2-AD2" {
        compartment_id = "${lookup(data.oci_identity_compartments.ELASTIC.compartments[0],"id")}"
  vcn_id = "${lookup(data.oci_core_vcns.OCI_ES_VCN.virtual_networks[0],"id")}"
  state = "AVAILABLE"
  filter {
      name = "display_name"
      values = ["PrivateSubnetAD2"]
      regex = true
  }
}
data "oci_identity_tenancy" "oci_tenancy" {
  tenancy_id = "${var.tenancy_ocid}"
}

