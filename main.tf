provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-0166fe664262f664c"
instance_type = "t2.micro"
key_name = "raja123"
vpc_security_group_ids = ["sg-093141840c6209335"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["JENKINS",  "TOMCAT-1", "TOMCAT-2", "MONITER",]
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true  # Prevent logging of sensitive values
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true  # You can mark it as sensitive to avoid logging the value
}
