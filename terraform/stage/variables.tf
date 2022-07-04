variable "ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-052efd3df9dad4825"

  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "Please provide a valid value for variable AMI."
  }
}

variable "type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
  sensitive   = true
}

variable "tags" {
  type = object({
    name = string
    env  = string
  })
  description = "Tags for the EC2 instance"
  default = {
    name = "My Virtual Machine"
    env  = "Dev"
  }
}
variable "server_port" {
  type        = number
  description = "Number server port"
  default     = 8080
  sensitive   = true
}
variable "subnet_id" {
  type = string
  //default = "subnet-00b40b2c0214ed2e5"
}

# data "aws_subnet_ids" "default" {
# vpc_id = data.aws_vpc.default.id
# }
# data "aws_vpc" "default" {
# default = true
# }

# data "aws_subnet" "default" {
# vpc_id = data.aws_vpc.default.id
# }
