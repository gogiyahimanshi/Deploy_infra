##########################################################
# AWS ECS-CLUSTER
#########################################################

resource "aws_ecs_cluster" "ecs-ec2-cluster" {
  name = "ecs-ec2-cluster"
}
