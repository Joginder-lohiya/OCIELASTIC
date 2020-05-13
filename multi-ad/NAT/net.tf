resource "oci_core_internet_gateway" "OCI_ES_IGW" {
  compartment_id = var.compartment_ocid
  display_name   = var.OCI_ES_IGW
  vcn_id         = "${local.VCN-ID}"
}

resource "oci_core_route_table" "OCI_PUB_RTB" {
  compartment_id = var.compartment_ocid
  vcn_id         = "${local.VCN-ID}"
  display_name   = var.OCI_PUB_RTB

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.OCI_ES_IGW.id
  }
}
resource "oci_core_nat_gateway" "OCI_ES_NGW" {
  compartment_id = var.compartment_ocid
  display_name   = var.OCI_ES_NGW
  vcn_id         = "${local.VCN-ID}"
}


resource "oci_core_route_table" "OCI_PVT_RTB" {
  compartment_id = var.compartment_ocid
  vcn_id         = "${local.VCN-ID}"
  display_name   = var.OCI_PVT_RTB

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.OCI_ES_NGW.id
  }
}

resource "oci_core_security_list" "LBSecList" {
  compartment_id = var.compartment_ocid
  display_name   = var.LBSecList
  vcn_id         = "${local.VCN-ID}"

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    tcp_options {
      max = 9200
      min = 9200
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  }
  ingress_security_rules {
    tcp_options {
      max = 5601
      min = 5601
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "PrivSecList" {
  compartment_id = var.compartment_ocid
  display_name   = var.PrivSecList
  vcn_id         = "${local.VCN-ID}"

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    tcp_options {
      max = 9200
      min = 9200
    }

    protocol = "6"
    source   = var.VCN-CIDR
  }
  ingress_security_rules {
    tcp_options {
      max = 9300
      min = 9300
    }

    protocol = "6"
    source   = var.VCN-CIDR
  }
  ingress_security_rules {
    tcp_options {
      max = 5601
      min = 5601
    }

    protocol = "6"
    source   = var.VCN-CIDR
  }
  ingress_security_rules {
    tcp_options {
      max = 22
      min = 22
    }

    protocol = "6"
    source   = var.VCN-CIDR
  }
}
