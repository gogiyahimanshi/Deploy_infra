###########################################################
# AWS ECS-EC2
###########################################################
resource "aws_instance" "ec2_instance" {
  ami                    = "ami-05fa00d4c63e32376"
  subnet_id              =  "subnet-06ef050e6cdffdd76"
  instance_type          = "t2.micro"
  iam_instance_profile   = "ecs-instance-profile" 
  vpc_security_group_ids = ["sg-08f5cda26c3d8bf0f"]
  key_name               = "key1"
  ebs_optimized          = "false"
  source_dest_check      = "false"
  associate_public_ip_address = "true"
  #user_data              = "${data.template_file.user_data.rendered}"
  user_data              = "${file("user_data.sh")}"
  /*root_block_device = {
    volume_type           = "gp2"
    volume_size           = "30"
    delete_on_termination = "true"
  }
  */

lifecycle {
    ignore_changes         = ["ami", "user_data", "subnet_id", "key_name", "ebs_optimized", "private_ip"]
  }

tags = {
    Name = "ecs-instance"
  }
}

//data "template_file" "user_data" {
//  template = "${file("${path.module}/user_data.tpl")}"
//}