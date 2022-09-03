# Terraform Amazon Virtual Private Cloud (VPC) 
### Amazon Virtual Private Cloud (VPC) Resources using Terraform

![Architecture Diagrams](https://user-images.githubusercontent.com/47545538/188021416-0acb01a1-f666-4cc1-9e9c-6888bb2e8435.jpg)
Use Terraform IaC Amazon VPC modules to create an Amazon VPC baseline configuration.

Terraform includes the below set of resources using the modules:
* VPC
* Two public subnets and four private subnets (two application subnets + two database subnets)
* Route table for each subnet
* Internet gateway for public subnets
* Elastic IP addresses for NAT gateways
* NAT gateway for each application subnets
* Network ACLs for a group of public subnets, application subnets, and database subnets
* S3 Gateway endpoint for VPC
* IAM roles for publishing flow logs to CloudWatch Logs
* VPC flow logs with CloudWatch Logs as a destination


For more information on Amazon VPC, visit [Amazon Virtual Private Cloud](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).

For more information on Terraform AWS VPC, visit [Terraform Resource: aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc).