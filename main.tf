resource "aws_instance" "k3s_server" {

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              curl -sfL https://get.k3s.io | sh -
              chmod 644 /etc/rancher/k3s/k3s.yaml
              EOF

  tags = {
    Name = "k3s-server"
  }
}
