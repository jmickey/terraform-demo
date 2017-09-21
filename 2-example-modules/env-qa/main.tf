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

module "web_ec2" {
  source    = "../modules/ec2"
  env       = "${var.env}"
  ami_id    = "${data.aws_ami.aws_linux_ami.id}"
  count     = "${var.count}"
  subnet_id = "${var.subnet_id}"
}

module "web_elb" {
  source            = "../modules/elb"
  env               = "${var.env}"
  instance_port     = "${var.instance_port}"
  instance_protocol = "${var.instance_protocol}"
  lb_port           = "${var.lb_port}"
  lb_protocol       = "${var.lb_protocol}"
  instances         = "${module.web_ec2.instance_ids}"
}
