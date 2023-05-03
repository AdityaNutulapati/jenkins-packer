# packer {
#   required_plugins {
#     amazon = {
#       version = ">= 0.0.2"
#       source  = "github.com/hashicorp/amazon"
#     }
#   }
# }

source "amazon-ebs" "test-1" {
  ami_name      = "packer-success-test-2"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami = "ami-007855ac798b5175e"
  ssh_username = "ubuntu"
  profile = "jenkins-packer"
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
