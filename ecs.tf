resource aws_ecs_cluster ecs_cluster {
  name = var.cluster_name
  tags = merge(var.tags, {
    Name = "phpipam-ecs-cluster"
    Description = "ECS cluster for phpipam image"
  })
}

output cluster_id {
  value = aws_ecs_cluster.ecs_cluster.id
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "21290381290389102"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "0.0.0.0/0"
  }

  tags = {
    Name = "allow_all"
  }
}
