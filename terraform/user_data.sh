#!/bin/bash

# Update all packages

sudo yum update -y
sudo amazon-linux-extras disable docker
sudo amazon-linux-extras install -y ecs
systemctl enable --now --no-block ecs.service
sudo cp /usr/lib/systemd/system/ecs.service /etc/systemd/system/ecs.service
sudo sed -i '/After=cloud-final.service/d' /etc/systemd/system/ecs.service
sudo systemctl daemon-reload
sudo curl -s http://localhost:51678/v1/metadata | python -mjson.tool

#There is deadlock so we need to modify the service
#https://github.com/aws/amazon-ecs-agent/issues/1707

#Adding cluster name in ecs config
echo ECS_CLUSTER=ecs-ec2-cluster >> /etc/ecs/ecs.config
cat /etc/ecs/ecs.config | grep "ECS_CLUSTER"