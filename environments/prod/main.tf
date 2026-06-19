module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.1.0.0/16"
}

module "subnet" {
  source = "../../modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "igw" {
  source = "../../modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "nat" {
  source           = "../../modules/nat"
  public_subnet_id = module.subnet.public_subnet_ids[0]
}

module "sg" {
  source = "../../modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source          = "../../modules/alb"
  vpc_id          = module.vpc.vpc_id
  alb_sg_id       = module.sg.alb_sg_id
  public_subnets  = module.subnet.public_subnet_ids
}

module "asg" {
  source             = "../../modules/autoscaling"
  ami_id             = "ami-0abcdef1234567890"
  instance_type      = "t3.medium"
  desired            = 3
  min                = 2
  max                = 5
  ec2_sg_id          = module.sg.ec2_sg_id
  private_subnets    = module.subnet.private_subnet_ids
  target_group_arn   = module.alb.target_group_arn
}