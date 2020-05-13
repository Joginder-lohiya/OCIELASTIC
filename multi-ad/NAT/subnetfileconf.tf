locals {

  SubNetLBSubnetAD1 = "${concat(data.oci_core_subnets.SubNet-LBSubnetAD1-AD1.subnets, list(map("id", "")))}"

  SubNetLBSubnetAD2 = "${concat(data.oci_core_subnets.SubNet-LBSubnetAD2-AD2.subnets, list(map("id", "")))}"
 
  SubNetPrivateSubnetAD1 = "${concat(data.oci_core_subnets.SubNet-PrivateSubnetAD1-AD1.subnets, list(map("id", "")))}"
  
  SubNetPrivateSubnetAD3 = "${concat(data.oci_core_subnets.SubNet-PrivateSubnetAD3-AD3.subnets, list(map("id", "")))}"
  SubNetPrivateSubnetAD2 = "${concat(data.oci_core_subnets.SubNet-PrivateSubnetAD2-AD2.subnets, list(map("id", "")))}"
  vcnid = "${concat(data.oci_core_vcns.OCI_ES_VCN.virtual_networks, list(map("id", "")))}"

}
