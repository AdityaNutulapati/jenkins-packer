# packer {
#   required_plugins {
#     amazon = {
#       version = ">= 0.0.2"
#       source  = "github.com/hashicorp/amazon"
#     }
#   }
# }
variable "aws_key" {
  type = string
  default= "aws"
}
variable "aws_secret" {
  type = string
  default="aws"
}
source "amazon-ebs" "test-1" {
  ami_name      = "packer-success-test-2"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami = "ami-007855ac798b5175e"
  ssh_username = "ubuntu"
  aws_access_key_id = var.aws_key
  aws_secret_access_key = var.aws_secret
}

build {
  name = "packer-test-1"
  sources = [
    "source.amazon-ebs.test-1"
  ]
  provisioner "shell" {

    inline=[
    "echo 'sample scripts working' " ,
    "sudo update -y" ,
    "sudo install -y git"
    ]

    }   
  
}
# "provisioners": [
# {
# "type": "shell",
# "inline": [
# "sudo yum update -y",
# "sudo yum install -y git"
# ]
# }
# ]
