variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Machine Image ID"
  default     = "ami-04a81a99f5ec58529"  # Debian 10 (Buster) AMI ID
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_pair" {
  description = "Name of the AWS key pair"
  default     = "key-pair"
}
