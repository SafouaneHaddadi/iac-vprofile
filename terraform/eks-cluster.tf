module "eks" {
  # Source du module EKS, provenant du registre Terraform
  source  = "terraform-aws-modules/eks/aws"
  version = "19.19.1" # Version du module à utiliser

  # Nom du cluster, défini par la variable locale
  cluster_name = local.cluster_name

  # Version de Kubernetes à déployer sur le cluster EKS
  cluster_version = "1.27"

  # Identifiant du VPC où le cluster sera déployé
  vpc_id = module.vpc.vpc_id

  # Sous-réseaux privés où les nœuds du cluster seront déployés
  subnet_ids = module.vpc.private_subnets

  # Activation de l'accès public à l'endpoint du cluster EKS
  cluster_endpoint_public_access = true

  # Configuration par défaut pour les groupes de nœuds gérés par EKS
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64" # Type d'AMI à utiliser pour les nœuds (Amazon Linux 2)
  }

  # Définition des groupes de nœuds gérés par EKS
  eks_managed_node_groups = {
    one = {                           # autoscaling group information pour le grp de noeuds
      name           = "node-group-1" # Nom du premier groupe de nœuds
      instance_types = ["t3.small"]   # Type d'instance à utiliser
      min_size       = 1              # Taille minimale du groupe de nœuds
      max_size       = 3              # Taille maximale du groupe de nœuds
      desired_size   = 2              # Taille désirée du groupe de nœuds
    }

    two = {
      name           = "node-group-2" # Nom du deuxième groupe de nœuds
      instance_types = ["t3.small"]   # Type d'instance à utiliser
      min_size       = 1              # Taille minimale du groupe de nœuds
      max_size       = 2              # Taille maximale du groupe de nœuds
      desired_size   = 1              # Taille désirée du groupe de nœuds
    }
  }
}
