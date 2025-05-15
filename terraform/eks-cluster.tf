module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.19.1"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id     = module.vpc.vpc_id          # VPC où le cluster sera déployé
  subnet_ids = module.vpc.private_subnets # subnet privés où les nœuds du cluster seront déployés

  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64" # Type d'AMI à utiliser pour les nœuds (Amazon Linux 2)

  }

  # Définition des groupes de nœuds gérés par EKS
  eks_managed_node_groups = {
    one = {
      name = "node-group-1" #info autoscaling group pour le grp de noeuds

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
