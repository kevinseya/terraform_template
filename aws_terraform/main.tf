resource "aws_instance" "nginx-server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.clave2.key_name

    user_data = <<-EOF
            #!/bin/bash
            sudo yum install -y nginx
            sudo systemctl enable nginx
            sudo systemctl start nginx
            EOF

   vpc_security_group_ids = [
	aws_security_group.nginx-server-sg.id
  ]

  tags = {
    Name        = var.server_name
    Environment = var.environment
    Owner       = "kmchancusi@uce.edu.ec"
    Team        = "Infraestructura como código"
    Project     = "UCE"
  }


  }

  resource "aws_key_pair" "clave2" {
  key_name   = "clave2"
  public_key = file(var.public_key_path)
    tags = {
        Name        = var.server_name
        Environment = var.environment
        Owner       = "kmchancusi@uce.edu.ec"
        Team        = "Infraestructura como código"
        Project     = "UCE"
    }

  }

  ####### SG ####### 
resource "aws_security_group" "nginx-server-sg" {
  name        = "nginx-server-sg"
  description = "Security group allowing SSH and HTTP access"

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
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    tags = {
    Name        = var.server_name
    Environment = var.environment
    Owner       = "kmchancusi@uce.edu.ec"
    Team        = "Infraestructura como código"
    Project     = "UCE"
  }

}