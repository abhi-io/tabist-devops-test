variable "region" {
  default = "ap-south-1"
  type    = string
}
variable "app_name" {
  default = "test-app"
  type    = string
}
variable "tags" {
  type = map(string)
  default = {
    owner       = "abhi"
    terraform   = "true"
    environment = "test"
    irrelevant  = "true"
  }
}
variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "open_ingress_ports" {
  type    = list(number)
  default = [80]
}