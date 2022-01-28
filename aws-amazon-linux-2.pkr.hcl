packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "amazon-linux-2" {
  ami_name      = "packer-amazon-linux-2"
  instance_type = "t2.micro"
  region        = "us-east-1"

  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-2.0.*.0-x86_64-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }

    most_recent = true
    owners      = ["137112412989"]
  }

  ssh_username = "ec2-user"
}

build {
  name = "packer-image"
  sources = [
    "source.amazon-ebs.amazon-linux-2"
  ]
  provisioner "shell" {

    environment_vars = [
      "FOO=hello world",
    ]

    scripts = ["./scripts/initial_config.sh"]

  }
  
  provisioner "file" {
    source = "./scripts/web/*"  
    destination = "/tmp/"
  }
  
  provisioner "shell" {
    inline = [
      "sudo mv /tmp/* /var/www/html/"
    ]
  }
}
