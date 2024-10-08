provider "aws" {
  region = var.REGION
}

resource "aws_instance" "k8s_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Reemplaza con la AMI adecuada para tu región
  instance_type = "t3.medium"
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.my_sg.id]
  
  tags = {
    Name = "K8sInstance"
  }

  # User data para instalar Docker y Kubernetes
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
              curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
              echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list
              apt-get update
              apt-get install -y kubelet kubeadm kubectl
              systemctl enable kubelet
              EOF
}

resource "aws_security_group" "my_sg" {
  name   = "terraform-tcp-security-group"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.PUBLIC_IP}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
