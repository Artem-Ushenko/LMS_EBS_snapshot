provider "aws" {
    region = "eu-north-1a"
}

resource "aws_ebs_volume" "example" {
    availability_zone = "eu-north-1a"
    size              = 1  // Define size as per your requirement
}
