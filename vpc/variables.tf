
variable "enviromment_name" {
  type = string
  default = "dev"
}

variable "public_subnets" {
    type = list(string)
    default = [ "10.0.1.0/26", "10.0.2.0/26", "10.0.3.0/26" ]
}

variable "private_subnets" {
  type = list(string)
  default = [ "10.0.4.0/26", "10.0.5.0/26", "10.0.6.0/26" ]
}

variable "database_subnets" {
    type = list(string)
    default = ["10.0.21.0/24", "10.0.22.0/24"]
  
}

variable "vpc_cdir" {
    type = string
    default = "10.0.0.0/16"
}