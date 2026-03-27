# Security Group
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  
  }
}

# Instância EC2
resource "aws_instance" "web_server" {
  ami           = "ami-0b0b78dcacbab728f"  # AMI do Amazon Linux 2023 (x86_64)
  instance_type = "t2.micro"
  key_name      = "Name-key"
  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "Desafio DevOps #1 — Deploy realizado com sucesso!" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer"
  }

  associate_public_ip_address = true
}
