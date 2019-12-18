# Configure the Cloudflare provider
provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
}
# Create a record
resource "cloudflare_record" "www-west" {
  zone_id = var.zone_id
  name    = "${var.name}-west"
  value   = aws_instance.www-west.public_ip
  type    = "A"
  proxied = true
}
resource "cloudflare_record" "www-east" {
  zone_id = var.zone_id
  name    = "${var.name}-east"
  value   = aws_instance.www-east.public_ip
  type    = "A"
  proxied = true
}
