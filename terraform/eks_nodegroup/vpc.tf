module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "eks-vpc"
  cidr = "12.0.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["12.0.1.0/24", "12.0.2.0/24", "12.0.3.0/24"]
  public_subnets  = ["12.0.101.0/24", "12.0.102.0/24", "12.0.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway  = true
  one_nat_gateway_per_az = false

  public_subnet_tags = {
     "kubernetes.io/role/elb" = 1
 }

 private_subnet_tags = {
     "kubernetes.io/role/internal-elb" = 1
 }
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
