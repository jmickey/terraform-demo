resource "aws_elb" "elb" {
  name               = "${format("mod-elb-%s-%s", var.product, var.env)}"
  availability_zones = ["${split(",", var.availablity_zones)}"]

  listener {
    instance_port     = "${var.instance_port}"
    instance_protocol = "${var.instance_protocol}"
    lb_port           = "${var.lb_port}"
    lb_protocol       = "${var.lb_protocol}"
  }

  instances = ["${var.instances}"]

  tags = {
    Product     = "${var.product}"
    Environment = "${var.env}"
    Terraform   = "true"
  }
}
