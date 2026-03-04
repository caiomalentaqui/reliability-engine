variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "Instance tenancy for the VPC"
  type        = string
  default     = "default"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Name        = "reliability-engine-vpc"
    Environment = "dev"
    Project     = "engine-sre"
    ManagedBy   = "terraform"
  }
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_name" {
  description = "Name tag for the public subnet"
  type        = string
  default     = "Public subnet for us-east-2"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_name" {
  description = "Name tag for the private subnet"
  type        = string
  default     = "Private subnet for us-east-2"
}

variable "igw_name" {
  description = "Name tag for the internet gateway"
  type        = string
  default     = "reliability-engine-igw"
}

variable "internet_cidr" {
  description = "CIDR for internet route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_rt_name" {
  description = "Name tag for the public route table"
  type        = string
  default     = "reliability-public-rt"
}

variable "web_sg_name" {
  description = "Security group name for web servers"
  type        = string
  default     = "reliability-web-sg"
}

variable "web_sg_description" {
  description = "Security group description"
  type        = string
  default     = "Permitir HTTP e SSH"
}

variable "http_port" {
  description = "HTTP port"
  type        = number
  default     = 80
}

variable "ssh_port" {
  description = "SSH port"
  type        = number
  default     = 22
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed for ingress/egress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_protocol" {
  description = "Protocol for egress rules"
  type        = string
  default     = "-1"
}

variable "ami" {
  description = "AMI to use for the web instance"
  type        = string
  default     = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "assign_public_ip" {
  description = "Whether to associate a public IP to the instance"
  type        = bool
  default     = true
}

variable "user_data" {
  description = "User data script for instance"
  type        = string
  default     = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Provisionado via Terraform - SRE Lab</h1>" > /var/www/html/index.html
              EOF
}

variable "web_instance_name" {
  description = "Name tag for the web instance"
  type        = string
  default     = "reliability-web-server"
}