provider "aws" {
  region = "us-west-1"  # Cambia esto a tu región preferida
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my_subnet"
  }
}

resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Cambia esto para restringir el acceso a tu IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "k8s_instance" {
  ami           = "ami-00f251754ac5da7f0"  # AMI de Amazon Linux 2; cambia según la región
  instance_type = "t2.micro"               # Cambia el tipo de instancia si es necesario
  subnet_id     = aws_subnet.my_subnet.id
  security_groups = [aws_security_group.allow_ssh.name]

  user_data = <<-EOF
              #!/bin/bash
              # Instalar Docker
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user

              # Iniciar contenedores automáticamente
              sudo docker run -d --name nginx-container -p 80:80 nginx
              sudo docker run -d --name httpd-container -p 8080:80 httpd
              sudo docker run -d --name redis-container -p 6379:6379 redis
              EOF
}

output "instance_public_ip" {
  value = aws_instance.k8s_instance.public_ip
}
