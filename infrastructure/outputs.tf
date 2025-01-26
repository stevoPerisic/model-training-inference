output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.gpu_instance[*].id
}
