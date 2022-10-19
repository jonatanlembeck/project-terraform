variable "region" {
  description = "Região hospedagem"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Minha chave ppk"
  type        = string
  default     = "MYAppServer"

}
variable "aws_security_group" {
  description = "Meu SG"
  type        = string
  default     = "my-SG-tf"
}
variable "availability_zone" {
  description = "Zonas da Virginia"
  default     = ["us-east-1a"]
  
}

variable "instance_Tenancy" {
  default = "default"
}
variable "dnsSupport" {
  default = true
}

variable "dnsHostName" {
  default = true
}
variable "vpcCIDRblock" {
  default = "10.0.0.0/16"
}
variable "publicsCIDRblock" {
  default = "10.0.1.0/24"
}
variable "publicdestCIDRblock" {
  default = "0.0.0.0/0"
}
variable "localdestCIDRblock" {
  default = "10.0.0.0/16"
}
variable "ingressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
variable "egressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
variable "mapPublicIP" {
  default = true
}
