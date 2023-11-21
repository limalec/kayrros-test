provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "flask_api" {
  ami           = "d-c3671f900d"  # Remplacez par l'ID de l'AMI souhaité
  instance_type = "t2.micro" # Ou choisissez une instance appropriée

  tags = {
    Name = "FlaskAPIInstance"
  
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
