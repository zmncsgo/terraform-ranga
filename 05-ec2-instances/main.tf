provider "aws" {
  region                   = "eu-west-2"
  shared_config_files      = ["/Users/Zamanbek_Khussainov/.aws/config"]
  shared_credentials_files = ["/Users/Zamanbek_Khussainov/.aws/credentials"]
}

resource "aws_default_vpc" "default" {

}


resource "aws_security_group" "http_server_sg" {
  name = "http_server_sg"
  //vpc_id = "vpc-084233c890e0ddcd0"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "http_server_sg"
  }
}

resource "aws_instance" "http_server" {
  ami                    = data.aws_ami.aws_linux-2-latest.id
  key_name               = "terraform"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  subnet_id              = tolist(data.aws_subnets.default_subnets.ids)[0]

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("C:/Users/Zamanbek_Khussainov/.aws/aws_keys/terraform.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "echo message in zaman - Virtual Server is at ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }
}

