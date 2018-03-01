# Provider declaration
provider "aws" {
  # AWS credentials should be declared as environment variables.
  region = "${var.region}"
}

# Retrieves latest Amazon Linux AMI.
data "aws_ami" "aws_linux_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "an_ec2_instance" {
  count         = "${var.count}"
  ami           = "${data.aws_ami.aws_linux_ami.id}"
  instance_type = "${var.instance_type}"

  subnet_id = "${var.count == 1 ? var.subnet_id : element(split(",", var.subnet_id), count.index)}"

  tags = {
    Name        = "${format("%s-%s-%01d", var.product, var.env, count.index + 1)}"
    Product     = "${var.product}"
    Environment = "${var.env}"
    Terraform   = "true"
  }
}

resource "aws_elb" "an_aws_elb" {
  name               = "${format("elb-%s-%s", var.product, var.env)}"
  availability_zones = ["${split(",", var.availablity_zones)}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances = ["${aws_instance.an_ec2_instance.*.id}"]

  tags = {
    Product     = "${var.product}"
    Environment = "${var.env}"
    Terraform   = "true"
  }
}
