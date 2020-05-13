locals {

SubNet-PrivateSubnetAD3-AD3 = "${lookup(local.SubNetPrivateSubnetAD3[0],"id")}"

SubNet-PrivateSubnetAD1-AD1 = "${lookup(local.SubNetPrivateSubnetAD1[0],"id")}"
SubNet-PrivateSubnetAD2-AD2 = "${lookup(local.SubNetPrivateSubnetAD2[0],"id")}"

SubNet-LBSubnetAD2-AD2 = "${lookup(local.SubNetLBSubnetAD2[0],"id")}"

SubNet-LBSubnetAD1-AD1 = "${lookup(local.SubNetLBSubnetAD1[0],"id")}"
VCN-ID = "${lookup(local.vcnid[0],"id")}"
}
