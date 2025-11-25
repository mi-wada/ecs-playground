resource "aws_ecr_repository" "ui" {
  image_tag_mutability = "MUTABLE"
  name                 = "ecsp/ui"
  region               = "ap-northeast-1"
  encryption_configuration {
    encryption_type = "AES256"
  }
}

# __generated__ by Terraform from "ecsp/omikuji"
resource "aws_ecr_repository" "omikuji" {
  image_tag_mutability = "MUTABLE"
  name                 = "ecsp/omikuji"
  region               = "ap-northeast-1"
  encryption_configuration {
    encryption_type = "AES256"
  }
}
