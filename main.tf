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
default = ["jenkins",  "tomcat-1", "tomcat-2", "Monitoring server"]
}