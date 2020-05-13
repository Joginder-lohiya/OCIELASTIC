#resource "oci_core_instance" "BastionHost" {
#  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[2]["name"]
#  compartment_id      = var.compartment_ocid
#  display_name        = var.BastionHost
#  shape               = var.BastionShape
#
#  create_vnic_details {
#    subnet_id              = oci_core_subnet.BastionSubnetAD3.id
#    skip_source_dest_check = true
#  }
#
#  metadata = {
#    ssh_authorized_keys = chomp(file(var.ssh_public_key))
#    user_data           = base64encode(file(var.BastionBootStrap))
#  }
#
#  source_details {
#    source_id   = var.InstanceImageOCID[var.region]
#    source_type = "image"
#  }
#
#  timeouts {
#    create = var.create_timeout
#  }
#}

resource "oci_core_instance" "ESMasterNode1" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = var.ESMasterNode1
  shape               = var.MasterNodeShape
#  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
#    subnet_id        = oci_core_subnet.PrivSubnetAD1.id
    subnet_id        = "${local.SubNet-PrivateSubnetAD1-AD1}"
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = chomp(file(var.ssh_public_key))
    user_data           = base64encode(file(var.ESBootStrap))
  }

  source_details {
    source_id               = var.InstanceImageOCID[var.region]
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  timeouts {
    create = var.create_timeout
  }
}

resource "oci_core_instance" "ESMasterNode2" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[1]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = var.ESMasterNode2
  shape               = var.MasterNodeShape
#  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
#    subnet_id        = oci_core_subnet.PrivSubnetAD2.id
    subnet_id        = "${local.SubNet-PrivateSubnetAD2-AD2}"
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = chomp(file(var.ssh_public_key))
    user_data           = base64encode(file(var.ESBootStrap))
  }

  source_details {
    source_id               = var.InstanceImageOCID[var.region]
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  timeouts {
    create = var.create_timeout
  }
}


resource "oci_core_instance" "ESDataNode1" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = var.ESDataNode1
  shape               = var.DataNodeShape
#  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
   # subnet_id        = oci_core_subnet.PrivSubnetAD1.id
    subnet_id        = "${local.SubNet-PrivateSubnetAD1-AD1}"
    assign_public_ip = false
  }
  metadata = {
    ssh_authorized_keys = chomp(file(var.ssh_public_key))
    user_data           = base64encode(file(var.ESBootStrap))
  }

  source_details {
    source_id               = var.InstanceImageOCID[var.region]
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  timeouts {
    create = var.create_timeout
  }
}

resource "oci_core_instance" "ESDataNode3" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[1]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = var.ESDataNode3
  shape               = var.DataNodeShape
#  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
   # subnet_id        = oci_core_subnet.PrivSubnetAD2.id
    subnet_id        = "${local.SubNet-PrivateSubnetAD2-AD2}"
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = chomp(file(var.ssh_public_key))
    user_data           = base64encode(file(var.ESBootStrap))
  }

  source_details {
    source_id               = var.InstanceImageOCID[var.region]
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  timeouts {
    create = var.create_timeout
  }
}

