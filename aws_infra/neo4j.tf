module "neo4j" {
  source       = "./neo4j"
  region       = var.region
  project_name = var.project_name

  vpc_id    = data.aws_vpc.default.id
  subnet_id = tolist(data.aws_subnet_ids.default.ids)[0]
  key_name  = aws_key_pair.neo4j.key_name
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_key_pair" "neo4j" {
  key_name   = "neo4j"
  public_key = file("${path.module}/neo4j.pem.pub")
}
