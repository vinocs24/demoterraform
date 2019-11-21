# EC2 Instances

resource "aws_instance" "ec2-instance" {
    ami                         = "${lookup(var.ami, var.region)}"
    instance_type               = "${var.instance_type}"
    availability_zone           = "us-east-1a"
    subnet_id                   = "${aws_subnet.wp-public-tf.id}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    security_groups             = ["${aws_security_group.wp-sg-tf.id}"]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
    tags {
      Name = "ec2-instance"
    }
}
