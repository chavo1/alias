# The default provider configuration
provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}
# Additional provider configuration for west coast region
provider "aws" {
  alias      = "west"
  region     = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}
# The following instance will be deployed with 'provider = aws.west' 
resource "aws_instance" "www-west" {
  provider = aws.west

  ami           = var.ami_west
  instance_type = "t2.micro"
  key_name      = aws_key_pair.chavo-west.id

  connection {
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip // tf12 
  }
  provisioner "file" {
    source      = "asset"
    destination = "/tmp"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/asset/setup-web.sh",
      "sudo /tmp/asset/setup-web.sh",
    ]
  }

  tags = {
    Name = "chavo"
  }
}
# The following instance will be deployed with 'provider = aws' 
resource "aws_instance" "www-east" {

  ami           = var.ami_east
  instance_type = "t2.micro"


  key_name = aws_key_pair.chavo-east.id

  connection {
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip // tf12 
  }
  provisioner "file" {
    source      = "asset"
    destination = "/tmp"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/asset/setup-web.sh",
      "sudo /tmp/asset/setup-web.sh",
    ]
  }
  tags = {
    Name = "chavo"
  }
}
