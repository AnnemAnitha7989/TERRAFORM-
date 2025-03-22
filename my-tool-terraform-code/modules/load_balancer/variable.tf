variable "load_balancer_name" {
  type = string
}

variable "load_balancer_internal" {
  type = bool
}

variable "load_balancer_load_balancer_type" {
  type = string
}

variable "load_balancer_security_groups" {
  type = list(string)
}

variable "load_balancer_subnets" {
  type = list(string)
}