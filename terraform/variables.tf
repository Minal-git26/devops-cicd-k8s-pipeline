variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance (use a current Amazon Linux 2023 AMI for your region)"
  type        = string
  default     = "ami-0c101f26f147fa7fd" # Example only — verify current AMI for your region
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro" # Free tier eligible
}
