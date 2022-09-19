resource "aws_cloudwatch_log_group" "log_group" {
  name = "ecs-log-group"
    tags = {
    Environment = "production"
  }
}