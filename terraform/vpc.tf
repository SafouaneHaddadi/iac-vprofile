module "vpc" {
  # Source du module VPC à utiliser, ici depuis le registre Terraform AWS
  source = "terraform-aws-modules/vpc/aws"

  # Version du module à utiliser
  version = "5.1.2"

  # Nom de la VPC à créer
  name = "vprofile-eks"

  # CIDR (Classless Inter-Domain Routing) pour la VPC, définit l'adresse IP de la VPC
  cidr = "172.20.0.0/16"

  # Récupère les trois premières zones de disponibilité disponibles
  # azs  = slice(data.aws_availability_zones.available.names, 0, 3)
  azs = slice(data.aws_availability_zones.available.names, 0, min(length(data.aws_availability_zones.available.names), 3))

  # Sous-réseaux privés à créer avec leurs plages d'adresses IP
  private_subnets = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]

  # Sous-réseaux publics à créer avec leurs plages d'adresses IP
  public_subnets = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]

  # Activation de la passerelle NAT pour permettre aux sous-réseaux privés d'accéder à Internet
  enable_nat_gateway = true

  # Utilisation d'une seule passerelle NAT pour tous les sous-réseaux privés
  single_nat_gateway = true

  # Activation des noms d'hôtes DNS pour la VPC
  enable_dns_hostnames = true

  # Tags pour les sous-réseaux publics, utilisés pour l'intégration avec Kubernetes
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared" # Indique que ce sous-réseau est partagé avec le cluster
    "kubernetes.io/role/elb"                      = 1        # Tag pour indiquer que ce sous-réseau est utilisé pour les ELB (Elastic Load Balancer)
  }

  # Tags pour les sous-réseaux privés, également utilisés pour l'intégration avec Kubernetes
  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared" # Indique que ce sous-réseau est partagé avec le cluster
    "kubernetes.io/role/internal-elb"             = 1        # Tag pour indiquer que ce sous-réseau est utilisé pour les ELB internes
  }
}
