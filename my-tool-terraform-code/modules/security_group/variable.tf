variable "security_group_name" {
  type = string
}

variable "security_group_description" {
  type = string
}

variable "security_group_vpc_id" {
  type = string
}

variable "ingress_rules" {
  description = "ingress rules"
  type = list(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
}


variable "egress_from_port" {
  type = number
}

variable "egress_to_port" {
  type = number
}

variable "egress_protocol" {
  type = string
}

variable "egress_cidr_block" {
  type = list(string)
}