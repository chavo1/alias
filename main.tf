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
resource "aws_instance" "west" {
  provider = aws.west

  ami           = var.ami_west
  instance_type = "t2.micro"

  tags = {
    Name = "chavo"
  }
}
# The following instance will be deployed with 'provider = aws' 
resource "aws_instance" "east" {

  ami           = var.ami_east
  instance_type = "t2.micro"

  tags = {
    Name = "chavo"
  }
}
