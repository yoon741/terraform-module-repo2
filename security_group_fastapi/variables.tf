variable "sg_name" {
  description = "name of SG"
  type        = string
}

variable "description" {
  description = "description of SG"
  type        = string
}

variable "ingress_port" {
  description = "ingress port number of SG"
  type        = number
}