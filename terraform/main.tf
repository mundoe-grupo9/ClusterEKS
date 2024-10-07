resource "aws_eks_cluster" "example" {
  name     = "my-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.public_subnet.id]
  }
}
