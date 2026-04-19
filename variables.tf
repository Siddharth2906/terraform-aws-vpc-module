variable "vpc_config" {
  description = "to get cidr and name of vpc"
  type = object({
    name = string
    cidr = string
  })
#   default ={}
}


variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-north-1"
}

variable "subnet_config" {
  description = "to get subnet configurations cidr and name of subnet and availability zone"
  type = map(object({
    cidr_block = string
    availability_zone = string
    public_subnet = optional(bool, false)

  }))
#   default = {}
}
