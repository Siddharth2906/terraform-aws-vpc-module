
provider "aws" {
  region = "eu-north-1"

}
module "vpc" {

  source = "source of module"

 vpc_config = {
    name = "name of vpc"
    cidr = "cidr of vpc"
 }
  subnet_config =   {
    "public-subnet-1" = {
      cidr_block = "cidr of subnet"
        availability_zone = "availability zone of subnet"
        public_subnet = "true or false"
    }
}
}