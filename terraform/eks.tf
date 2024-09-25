resource "aws_eks_cluster" "example" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::992382474736:user/kk_labs_user_640152"

  vpc_config {
    subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.public_subnet.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  
}

output "endpoint" {
  value = aws_eks_cluster.example.endpoint
}

#output "kubeconfig-certificate-authority-data" {
 # value = aws_eks_cluster.example.certificate_authority[0].data
 #}