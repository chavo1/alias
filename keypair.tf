# Public to allow logging-in to EC2 instances.
resource "aws_key_pair" "chavo-east" {
  key_name   = "chavo_east"
  public_key = file("~/.ssh/id_rsa.pub")
}
# Public to allow logging-in to EC2 instances.
resource "aws_key_pair" "chavo-west" {
  provider = aws.west

  key_name   = "chavo_west"
  public_key = file("~/.ssh/id_rsa.pub")
}