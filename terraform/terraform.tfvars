
//// NTW ////
sub_public_availability_zone  = "a"
sub_private_availability_zone = "b"

vpc_cidr_block         = "10.0.0.0/16"
sub_public_cidr_block  = "10.0.1.0/24"
sub_private_cidr_block = "10.0.2.0/24"

# Añade estas líneas a tu archivo terraform.tfvars existente

cluster_name    = "grupo9-eks-cluster"
cluster_version = "1.27"

# Opcional: ajusta estos valores según tus necesidades
eks_node_group_instance_types = ["t3.medium"]
eks_node_group_desired_size   = 2
eks_node_group_max_size       = 4
eks_node_group_min_size       = 1