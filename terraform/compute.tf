# Define security group for frontend & backend
data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-name"
    values = ["ShivBatch8"]
  }
}

resource "aws_instance" "frontend" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = var.instance_type
  key_name      = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-093d53da901ae4dcf"]
  user_data     = file("scripts/frontend_setup.sh")

  tags = {
    Name = "Frontend-skumar"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = var.instance_type
  key_name      = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-093d53da901ae4dcf"]
  user_data     = file("scripts/backend_setup.sh")

  tags = {
    Name = "Backend-skumar"
  }
}

