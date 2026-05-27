output "alb_dns_name" {
    value = aws_alb.example.dns_name
    description = "The DNS name of the Application Load Balancer"
}

output "asg_name" {
  value = aws_autoscaling_group.example
  description = "The name of the ASG"
}

output "alb_security_group_id" {
    value = aws_security_group.alb.id
    description = "The ID of the security group attached to the alb"
}