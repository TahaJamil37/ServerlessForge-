resource "aws_vpc_endpoint" "s3" {
  vpc_id          = aws_vpc.dev_vpc.id
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = [aws_route_table.private_route_table.id]
  tags = {
    Name = "S3 Gateway"
  }
}

resource "aws_vpc_endpoint" "secretsmanager" {
  vpc_id            = aws_vpc.dev_vpc.id
  service_name      = "com.amazonaws.${var.region}.secretsmanager"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.endpoint_sg.id,
  ]

  subnet_ids = [for s in aws_subnet.private_subnet : s.id]

  private_dns_enabled = true

  tags = {
    Name = "Secrets Endpoint"
  }
}