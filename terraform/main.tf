provider "kubernetes" {
  # Endpoint du cluster EKS, utilisé pour interagir avec le cluster Kubernetes
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data) # certif de l'autorité de certification du cluster
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {} # Données pour récupérer les zones de disponibilité disponibles dans la région spécifiée


locals {
  cluster_name = var.clusterName
}

##