
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "TEST" {
        ami = "${var.amiId}"
        subnet_id = "${var.subnetId}"
        instance_type = "t2.micro"
        tags {
                Name = "${var.nameTag}"
                Owner = "${var.ownerName}"
                Environment = "QA"
                ExpirationDate  = "2018-12-30"
                Project = "CBCAP-1"
        }
}

