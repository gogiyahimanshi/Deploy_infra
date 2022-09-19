# terraform-ecs-ec2

CI Pipleline :

CD Pipeline: 
Docs to be followed: 
https://medium.com/@awsyadav/automating-ecs-ec2-type-deployments-with-terraform-569863c60e69

Code refered from : https://gist.github.com/awsyadav

========================================================================================================
Difference between task access role and task execution role:
ECS task execution role is capabilities of ECS agent (and container instance), e.g:

Pulling a container image from Amazon ECR
Using the awslogs log driver
ECS task role is specific capabilities within the task itself, e.g:

When your actual code runs

=======================================================================================================
data "template_file" "task_definition" {
  template = "${file("${path.module}/task_definition.json")}"
}

container_definitions    = "${data.template_file.task_definition.rendered}"  

rendered:
The template_file data source renders a template from a template string, which is usually loaded from an external file. Note. In Terraform 0.12 and later, the templatefile function offers a built-in mechanism for rendering a template from a file.

========================================================================================================
Fix Junk charactor in console output:

install ansicolor plugin
and update pipeline as below

options {
        ansiColor('xterm')
    }

========================================================================================================
