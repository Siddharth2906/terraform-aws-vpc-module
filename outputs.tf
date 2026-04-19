output "vpc_id" {
  description = "to get the value for vpc id"
  value = aws_vpc.my-vpc.id
}

locals {
  public-subnet_output ={
    for k , v in local.public_subnet : k =>{
        id = aws_subnet.my-subnet[k].id
        availability_zone = v.availability_zone
    }
  }

    private-subnet_output ={
        for k , v in local.private_subnet : k =>{
            id = aws_subnet.my-subnet[k].id
            availability_zone = v.availability_zone
        }
    }
}

output "public_subnet" {
  description = "to get the value for public subnet id and availability zone"
  value = local.public-subnet_output
}

output "private_subnet" {
  description = "to get the value for private subnet id and availability zone"
  value = local.private-subnet_output
}