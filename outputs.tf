output "ec2_instance" {
    value = "${aws_instance.ec2-instance.public_ip}"
}
output "elb_dns" {
    value = "${aws_elb.default.dns_name}"
}
