##############################################################
# AWS ECS-SERVICE
##############################################################

resource "aws_ecs_service" "service" {
  cluster                = "${aws_ecs_cluster.ecs-ec2-cluster.id}"                                 # ecs cluster id
  desired_count          = 1                                                         # no of task running
  launch_type            = "EC2"                                                     # Cluster type ECS OR FARGATE
  name                   = "openapi-service"                                         # Name of service
  task_definition        = "${aws_ecs_task_definition.task_definition.arn}"        # Attaching Task to service
  load_balancer {
    container_name       = "openapi-ecs-container"                                  #"container_${var.component}_${var.environment}"
    container_port       = "3000"
    target_group_arn     = "${aws_alb_target_group.ecs-target-group.arn}"         # attaching load_balancer target group to ecs
 }
  network_configuration {
    security_groups       = ["sg-08f5cda26c3d8bf0f"] 
    subnets               = ["subnet-06ef050e6cdffdd76" , "subnet-05b6e0707d604bf50"]
    security_groups       = ["sg-0d3f9b88f5c8b41ad"]
    assign_public_ip      = "true"
  }
  depends_on              = ["aws_alb_listener.ecsapp"]
}