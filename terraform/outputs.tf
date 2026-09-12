output "instance_public_ip" {
  description = "Public IP address of the app server"
  value       = aws_instance.app_server.public_ip
}
