## HashiCorp - Packer

- Testing Packer tool
- Building from Amazon Linux 2 AMI with Apache Web Server running.

Install [Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/aws-get-started):

    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install packer
    
Run Build:
    
    packer build aws-amazon-linux-2.pkr.hcl

