output "public_ip-east" {
  value = aws_instance.www-east.*.public_ip
}
output "public_dns-east" {
  value = aws_instance.www-east.*.public_dns
}
output "public_ip-west" {
  value = aws_instance.www-west.*.public_ip
}
output "public_dns-west" {
  value = aws_instance.www-west.*.public_dns
}
output "hostname-east" {
  value = cloudflare_record.www-east.*.hostname
}
output "hostname-west" {
  value = cloudflare_record.www-west.*.hostname
}