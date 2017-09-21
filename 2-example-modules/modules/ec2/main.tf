resource "aws_instance" "ec2" {
  count         = "${var.count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  subnet_id = "${var.count == 1 ? var.subnet_id : element(split(",", var.subnet_id), count.index)}"

  tags = {
    Name        = "${format("mod-%s-%s-%02d", var.product, var.env, count.index + 1)}"
    Product     = "${var.product}"
    Environment = "${var.env}"
    Terraform   = "true"
  }
}
