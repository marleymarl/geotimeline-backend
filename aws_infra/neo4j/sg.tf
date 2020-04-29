resource "aws_security_group" "sg" {
  name_prefix = "${var.project_name}-neo4j"
  description = "Security group for the ${var.project_name} Neo4j cluster"
  vpc_id      = var.vpc_id

  tags = {
    terraformed = "true"
  }
}

# Causal clustering SG rules

locals {
  discovery_port   = 5000
  transaction_port = 6000
  raft_port        = 7000
}

resource "aws_security_group_rule" "discovery" {
  for_each          = toset(["ingress", "egress"])
  security_group_id = aws_security_group.sg.id
  type              = each.key
  protocol          = "tcp"
  from_port         = local.discovery_port
  to_port           = local.discovery_port
  self              = true
}

resource "aws_security_group_rule" "transaction" {
  for_each          = toset(["ingress", "egress"])
  security_group_id = aws_security_group.sg.id
  type              = each.key
  protocol          = "tcp"
  from_port         = local.transaction_port
  to_port           = local.transaction_port
  self              = true
}

resource "aws_security_group_rule" "raft" {
  for_each          = toset(["ingress", "egress"])
  security_group_id = aws_security_group.sg.id
  type              = each.key
  protocol          = "tcp"
  from_port         = local.raft_port
  to_port           = local.raft_port
  self              = true
}
