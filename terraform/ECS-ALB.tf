####################################################################
# AWS ECS-ALB
####################################################################

resource "aws_alb" "ecs-alb" {
  #internal            = "${var.internal}"  # internal = true else false
   name                = "ecs-alb"
  subnets             =  ["subnet-06ef050e6cdffdd76" , "subnet-05b6e0707d604bf50"]
  #security_groups     = [aws_security_group.AWS9.id]
  security_groups     = ["sg-08f5cda26c3d8bf0f"]
}


resource "aws_alb_target_group" "ecs-target-group" {
  name        = "ecs-target-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "vpc-021c9dd2d0c732849"
  target_type = "ip"


#STEP 1 - ECS task Running
  health_check {
    healthy_threshold   = "3"
    interval            = "10"
    port                = "8080"
    path                = var.health_check_path
    protocol            = "HTTP"
    unhealthy_threshold = "3"
  }
}

resource "aws_alb_listener" "ecsapp" {
  load_balancer_arn = aws_alb.ecs-alb.id
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #enable above 2 if you are using HTTPS listner and change protocal from HTTPS to HTTPS
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ecs-target-group.arn
  }
}
