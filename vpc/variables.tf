variable "project_name" {
  type        = string
  default     = ""
  description = "Name of project"
}

variable "region" {
  type        = string
  default     = ""
  description = "Region of AWS"
}

variable "cidr" {
  type    = string
  default = ""
}

variable "availability_zones" {
  type    = list(string)
  default = [""]
}

variable "private_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "public_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}