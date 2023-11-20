provider "aws" {
    region = "eu-north-1"  // Specify the AWS region, not an availability zone
}

resource "aws_ebs_volume" "example" {
    availability_zone = "eu-north-1a"  // Specify the availability zone for resources that require it
    size              = 1             // Define size as per your requirement
}
