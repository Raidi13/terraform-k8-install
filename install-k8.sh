#!/bin/bash

#check whether root user or not
# R="\e[31m"
# N="\e[0m"

#resize to 50 gb disk space .
 df -hT           
 lsblk            
 sudo growpart /dev/nvme0n1 4  
 sudo lvextend -l +50%FREE /dev/RootVG/rootVol         
 sudo lvextend -l +50%FREE /dev/RootVG/varVol         
 sudo xfs_growfs /  
 sudo xfs_growfs /var 

# docker install
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user
echo -e "$R Logout and Login again $N"


# kubectl install for kubernetes    
 curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.0/2024-09-12/bin/linux/amd64/kubectl
 chmod +x ./kubectl
 sudo mv kubectl /usr/local/bin/kubectl ( if you worngly enter use *sudo mv /worng path /correct path )mv is move
 
 # eksctl install
 ARCH=amd64
 PLATFORM=$(uname -s)_$ARCH
 curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
 # (Optional) Verify checksum
 # curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo mv /tmp/eksctl /usr/local/bin
