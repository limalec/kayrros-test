provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "flask_api" {
  ami           = "ami-id"  # Remplacez par l'ID de l'AMI souhaité
  instance_type = "t2.micro"

  tags = {
    Name = "FlaskAPIInstance"
  }

  provisioner "file" {
    source      = "./install.sh"
    destination = "/tmp/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "/tmp/install.sh",
    ]
  }
}
