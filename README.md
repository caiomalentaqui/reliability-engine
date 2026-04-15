# Meu Projeto de Infraestrutura (Reliability Engine)

Este é o meu lab de AWS e Terraform.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_lb.web_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public_1_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_2_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.web_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.public_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_cidr_blocks"></a> [allowed\_cidr\_blocks](#input\_allowed\_cidr\_blocks) | CIDR blocks allowed for ingress/egress | `list(string)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_ami"></a> [ami](#input\_ami) | AMI to use for the web instance | `string` | `"ami-0c7217cdde317cfec"` | no |
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Whether to associate a public IP to the instance | `bool` | `true` | no |
| <a name="input_az_1"></a> [az\_1](#input\_az\_1) | n/a | `string` | `"us-east-1a"` | no |
| <a name="input_az_2"></a> [az\_2](#input\_az\_2) | n/a | `string` | `"us-east-1b"` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_egress_protocol"></a> [egress\_protocol](#input\_egress\_protocol) | Protocol for egress rules | `string` | `"-1"` | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | HTTP port | `number` | `80` | no |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | Name tag for the internet gateway | `string` | `"reliability-engine-igw"` | no |
| <a name="input_instance_tenancy"></a> [instance\_tenancy](#input\_instance\_tenancy) | Instance tenancy for the VPC | `string` | `"default"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_internet_cidr"></a> [internet\_cidr](#input\_internet\_cidr) | CIDR for internet route | `string` | `"0.0.0.0/0"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"reliability-engine"` | no |
| <a name="input_public_rt_name"></a> [public\_rt\_name](#input\_public\_rt\_name) | Name tag for the public route table | `string` | `"reliability-public-rt"` | no |
| <a name="input_public_subnet_1_cidr"></a> [public\_subnet\_1\_cidr](#input\_public\_subnet\_1\_cidr) | CIDR da primeira subnet pública | `string` | `"10.0.1.0/24"` | no |
| <a name="input_public_subnet_2_cidr"></a> [public\_subnet\_2\_cidr](#input\_public\_subnet\_2\_cidr) | CIDR da segunda subnet pública | `string` | `"10.0.2.0/24"` | no |
| <a name="input_ssh_port"></a> [ssh\_port](#input\_ssh\_port) | SSH port | `number` | `22` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources | `map(string)` | <pre>{<br/>  "Environment": "dev",<br/>  "ManagedBy": "terraform",<br/>  "Name": "reliability-engine-vpc",<br/>  "Project": "engine-sre"<br/>}</pre> | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data script for instance | `string` | `"#!/bin/bash\napt-get update\napt-get install -y nginx\nsystemctl start nginx\nsystemctl enable nginx\necho \"<h1>Provisionado via Terraform - SRE Lab</h1>\" > /var/www/html/index.html\n"` | no |
| <a name="input_web_instance_name"></a> [web\_instance\_name](#input\_web\_instance\_name) | Name tag for the web instance | `string` | `"reliability-web-server"` | no |
| <a name="input_web_sg_description"></a> [web\_sg\_description](#input\_web\_sg\_description) | Security group description | `string` | `"Permitir HTTP e SSH"` | no |
| <a name="input_web_sg_name"></a> [web\_sg\_name](#input\_web\_sg\_name) | Security group name for web servers | `string` | `"reliability-web-sg"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_public_ip"></a> [instance\_public\_ip](#output\_instance\_public\_ip) | IP Público da Instância EC2 |
| <a name="output_instance_url"></a> [instance\_url](#output\_instance\_url) | URL para acessar o Nginx |
<!-- END_TF_DOCS --><!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.app_asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.cpu_scaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_launch_template.app_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public_1_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_2_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.ec2_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.public_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_1"></a> [az\_1](#input\_az\_1) | n/a | `string` | `"us-east-1a"` | no |
| <a name="input_az_2"></a> [az\_2](#input\_az\_2) | n/a | `string` | `"us-east-1b"` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | Name tag for the internet gateway | `string` | `"reliability-engine-igw"` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | AMI ID for the launch template | `string` | `"ami-0c7217cdde317cfec"` | no |
| <a name="input_instance_tenancy"></a> [instance\_tenancy](#input\_instance\_tenancy) | Instance tenancy for the VPC | `string` | `"default"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type for the launch template | `string` | `"t3.micro"` | no |
| <a name="input_internet_cidr"></a> [internet\_cidr](#input\_internet\_cidr) | CIDR for internet route | `string` | `"0.0.0.0/0"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"reliability-engine"` | no |
| <a name="input_public_rt_name"></a> [public\_rt\_name](#input\_public\_rt\_name) | Name tag for the public route table | `string` | `"reliability-public-rt"` | no |
| <a name="input_public_subnet_1_cidr"></a> [public\_subnet\_1\_cidr](#input\_public\_subnet\_1\_cidr) | CIDR da primeira subnet pública | `string` | `"10.0.1.0/24"` | no |
| <a name="input_public_subnet_2_cidr"></a> [public\_subnet\_2\_cidr](#input\_public\_subnet\_2\_cidr) | CIDR da segunda subnet pública | `string` | `"10.0.2.0/24"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources | `map(string)` | <pre>{<br/>  "Environment": "dev",<br/>  "ManagedBy": "terraform",<br/>  "Name": "reliability-engine-vpc",<br/>  "Project": "engine-sre"<br/>}</pre> | no |
| <a name="input_template_name"></a> [template\_name](#input\_template\_name) | Name for the launch template | `string` | `"reliability-engine-lt-"` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data script for instance | `string` | `"#!/bin/bash\napt-get update\napt-get install -y nginx\nsystemctl start nginx\nsystemctl enable nginx\necho \"<h1>Provisionado via Terraform - SRE Lab</h1>\" > /var/www/html/index.html\n"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_name"></a> [asg\_name](#output\_asg\_name) | Nome do grupo de auto scaling |
| <a name="output_load_balancer_dns"></a> [load\_balancer\_dns](#output\_load\_balancer\_dns) | Acesse a aplicação por aqui |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
