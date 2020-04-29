locals {
  ami           = "ami-064b5023b1b903df2"
  instance_type = "m4.large"

}

resource "aws_instance" "instance" {
  ami                         = local.ami
  instance_type               = local.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  user_data                   = var.user_data
  ebs_optimized               = true
  associate_public_ip_address = true
  vpc_security_group_ids      = aws_security_group.sg.id
  iam_instance_profile        = aws_iam_instance_profile.profile.id

  root_block_device {
    volume_size           = 64
    volume_type           = "gp2"
    delete_on_termination = false
  }

  ebs_block_device {
    device_name           = "/dev/xvdf"
    volume_size           = 64
    volume_type           = "gp2"
    delete_on_termination = false
  }

  lifecycle {
    ignore_changes = [key_name, user_data]
  }

  tags = {
    terraformed = "true"
  }
}
