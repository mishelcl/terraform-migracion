output "public_subnet_id" {
  value = aws_subnet.public-subnet.id
}

output "private_subnet_id_1" {
  value = aws_subnet.private-subnet-1.id
}

output "private_subnet_id_2" {
  value = aws_subnet.private-subnet-2.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.db-subnet-group.name
}

output "bastion_security_group_id" {
  value = aws_security_group.sg-bastion.id
}

output "sqlserver_security_group_id" {
  value = aws_security_group.sg-sqlserver.id
}

output "postgre_security_group_id" {
  value = aws_security_group.sg-postgre.id
}

