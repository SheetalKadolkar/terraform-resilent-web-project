output "s3_bucket" {
  value = var.bucket_name
}

output "elb_dns" {
  value = aws_elb.elb.dns_name
}
