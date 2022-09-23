resource "aws_ecr_repository" "ecr" {
  name = "ecr-repo-name"
  
}
output "repo-url" {
 value = "${aws_ecr_repository.ecr.repository_url}"
 }
