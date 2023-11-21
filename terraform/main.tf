provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "flask_api" {
  ami           = "X5dxNpJSjp/oJTFH/oiRQAlJzOSm7r2g/Y9A2DTM"
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
