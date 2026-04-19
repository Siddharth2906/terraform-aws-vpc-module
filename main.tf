 resource "aws_vpc" "my-vpc" {
   cidr_block = var.vpc_config.cidr
   tags = {
     Name = var.vpc_config.name
   }
 }

 resource "aws_subnet" "my-subnet" {
   for_each = var.subnet_config
   vpc_id = aws_vpc.my-vpc.id
   cidr_block = each.value.cidr_block
   availability_zone = each.value.availability_zone
 
   tags = {
     Name = each.key
   }
 }
 locals {
   public_subnet = {for k, v in var.subnet_config : k => v if v.public_subnet == true}

   private_subnet = {for k, v in var.subnet_config : k => v if v.public_subnet == false}
 }

 resource "aws_internet_gateway" "my-igw" {
   vpc_id = aws_vpc.my-vpc.id
   count = length(local.public_subnet) > 0 ? 1 : 0
   tags = {
     Name = "${var.vpc_config.name}-igw"
   }
 }

 resource "aws_route_table" "public_rt" {
   vpc_id = aws_vpc.my-vpc.id
   count = length(local.public_subnet) > 0 ? 1 : 0
   tags = {
     Name = "${var.vpc_config.name}-public-rt"
   }

    route {
      cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw[0].id
 }

 }

    resource "aws_route_table_association" "public_rt_assoc" {
    for_each = local.public_subnet
    subnet_id = aws_subnet.my-subnet[each.key].id
    route_table_id = aws_route_table.public_rt[0].id
    }



