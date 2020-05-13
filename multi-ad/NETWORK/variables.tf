variable "tenancy_ocid" {
}

variable "user_ocid" {
}

variable "fingerprint" {
}

variable "private_key_path" {
}


variable "region" {
default = "us-ashburn-1"
}

variable "compartment_ocid" {
default = "ocid1.compartment.oc1..aaaaaaaartnnf5bmtaiemfuwzaisce7th6a7uqextmne3pauzquzzqxwsslq"
}

variable "ssh_public_key" {
  default = "/root/.ssh/id_rsa.pub"
}

variable "ssh_private_key" {
  default = "/root/.ssh/id_rsa"
}

variable "BastionShape" {
  default = "VM.Standard.E2.2"
}

variable "MasterNodeShape" {
  default = "VM.Standard.E2.2"
}

variable "MasterNodeShape2" {
  default = "VM.StandardE2.1"
}
variable "DataNodeShape" {
  default = "VM.Standard2.1"
}

variable "BootVolSize" {
  default = "100"
}

variable "lb_shape" {
  default = "100Mbps"
}

// https://docs.cloud.oracle.com/iaas/images/image/cf34ce27-e82d-4c1a-93e6-e55103f90164/
// Oracle-Linux-7.6-2019.05.14-0
variable "InstanceImageOCID" {
  type = map(string)

  default = {
    ap-seoul-1     = "ocid1.image.oc1.ap-seoul-1.aaaaaaaalhbuvdg453ddyhvnbk4jsrw546zslcfyl7vl4oxfgplss3ovlm4q"
    ap-tokyo-1     = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaamc2244t7h3gwrrci5z4ni2jsulwcg76gugupkb6epzrypawcz4hq"
    ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaakjkxzw33dcocgu2oylpllue34tjtyngwru7pcpqn4qh2nwon7n7a"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaandqh4s7a3oe3on6osdbwysgddwqwyghbx4t4ryvtcwk5xikkpvhq"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaa2xe7cufdwkksdazshtmqaddgd72kdhiyoqurtoukjklktf4nxkbq"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaa4bfsnhv2cd766tiw5oraw2as7g27upxzvu7ynqwipnqfcfwqskla"
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaavtjpvg4njutkeu7rf7c5lay6wdbjhd4cxis774h7isqd6gktqzoa"
  }
}

variable "VCN-CIDR" {
  default = "192.168.0.0/25"
}

variable "BastSubnetAD1CIDR" {
  default = "192.168.0.0/28"
}

variable "PrivSubnetAD1CIDR" {
  default = "192.168.0.16/28"
}

variable "PrivSubnetAD2CIDR" {
  default = "192.168.0.32/28"
}

variable "PrivSubnetAD3CIDR" {
  default = "192.168.0.48/28"
}

variable "LBSubnetAD1CIDR" {
  default = "192.168.0.64/28"
}

variable "LBSubnetAD2CIDR" {
  default = "192.168.0.80/28"
}

variable "ESBootStrap" {
  default = "./scripts/ESBootStrap.sh"
}

variable "BastionBootStrap" {
  default = "./scripts/BastionBootStrap.sh"
}

variable "backend_set_health_checker_interval_ms" {
  default = "15000"
}

variable "KibanaPort" {
  default = "5601"
}

variable "ESDataPort" {
  default = "9200"
}

variable "create_timeout" {
  default = "60000m"
}

variable "DataVolSize" {
  default = "200"
}

variable "volume_attachment_attachment_type" {
  default = "iscsi"
}
variable "BastionHost" {
default = "BastionHost"
}
variable "ESMasterNode1" {
default = "ESMasterNode1"
}
variable "ESMasterNode2" {
default = "ESMasterNode2"
}
variable "ESDataNode1" {
default = "ESDataNode1"
}
variable "ESDataNode3" {
default = "ESDataNode3"
}

variable "OCI_ES_VCN" {
default = "OCI_ES_VCN"
}
variable "OCIESVCN" {
default = "OCIESVCN"
}
variable "OCI_ES_IGW" {
default = "OCI_ES_IGW"
}
variable "OCI_PUB_RTB" {
default = "OCI_PUB_RTB"
}
variable "OCI_ES_RTB" {
default = "OCI_ES_RTB"
}
variable "LBSecList" {
default = "LBSecList"
}
variable "PrivSecList" {
default = "PrivSecList"
}
variable "BastionSecList" {
default = "BastionSecList"
}
variable "LBSubnetAD1" {
default = "LBSubnetAD1"
}
variable "LBSubnetAD2" {
default = "LBSubnetAD2"
}
variable "PrivateSubnetAD1" {
default = "PrivateSubnetAD1"
}
variable "PrivateSubnetAD2" {
default = "PrivateSubnetAD2"
}
variable "BastionSubnetAD13" {
default = "BastionSubnetAD13"
}
variable "lbad1" {
default = "lbad1"
}
variable "lbad2" {
default = "lbad2"
}
variable "privad1" {
default = "privad1"
}
variable "privad2" {
default = "privad2"
}
variable "privad3" {
default = "privad3"
}
variable "bastsub" {
default = "bastsub"
}

variable "ES-LB" {
default = "ES-LB"
}
variable "ESKibana" {
default = "ESKibana"
}
variable "ES-Data" {
default = "ES-Data"
}
variable "KibanaLS" {
default = "KibanaLS"
}
variable "ESDataLS" {
default = "ESDataLS"
}
variable "OCI_ES_NGW" {
default = "OCI_ES_NGW"
}
variable "OCI_PVT_RTB" {
default = "OCI_PVT_RTB"
}
