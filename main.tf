resource "aws_instance" "k8-master-expense" {
    ami    = data.aws_ami.ami_id.id
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0e914dc599cdf119a"]
 
 # Root EBS volume configuration to  give # 50 GB storage
  root_block_device {
    volume_size = 50  
}
tags = merge(
    var.tags,
)
}