variable "ami_id" {
  description = "ID da AMI a ser utilizada"
  type        = string
  default     = "ami-0b0b78dcacbab728f"  # AMI do Amazon Linux 2023
}

variable "instance_type" {
  description = "Tipo da instância"
  type        = string
  default     = "t2.micro"
}
