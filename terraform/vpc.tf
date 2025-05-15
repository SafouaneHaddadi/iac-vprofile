module "vpc" {
  # Source du module VPC à utiliser, ici depuis le registre Terraform AWS
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "vprofile-eks"

  cidr = "172.20.0.0/16"

  # Récupère les trois premières zones de disponibilité disponibles
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
  public_subnets  = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true #pr ne pas avoir 3 nat gateway
  enable_dns_hostnames = true

  # Tags pour les sous-réseaux publics, utilisés pour l'intégration avec Kubernetes

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared" # Indique que ce sous-réseau est partagé avec le cluster
    "kubernetes.io/role/elb"                      = 1        #pour indiquer que ce subnet est utilisé pour les ELB 
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}
