variable "ami_id" {}
variable "instance_type" {}
variable "desired" {}
variable "min" {}
variable "max" {}
variable "ec2_sg_id" {}
variable "private_subnets" {
  type = list(string)
}
variable "target_group_arn" {}