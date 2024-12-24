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

variable "vpc_id" {
  type        = string
  default     = ""
  description = "Vpc id"
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

### ECS General ####

variable "capacity_providers" {
  type = list(any)
  default = [ 
    "FARGATE", "FARGATE_SPOT"
   ]  
}