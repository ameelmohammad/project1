variable "imageid" {
  type = string
  default = "ami-0fc5d935ebf8bc3bc"
}
variable "instantancetype" {
    type = string 
    default = "t2.micro"
}

variable "keyname" {
    type = string 
    default = "terraform"
}

variable "cidr_vpc" {
    type = string 
    default = "192.168.0.0/16"
}
variable "cidr_sub1" {
    type = string 
    default = "192.168.0.0/24"
}