provider "kubernetes" {
  # Endpoint du cluster EKS, utilisé pour interagir avec le cluster Kubernetes
  host = module.eks.cluster_endpoint

  # Certificat de l'autorité de certification du cluster, décodé depuis les données fournies par le module EKS
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  # Région AWS à utiliser, définie par la variable
  region = var.region
}

# Données pour récupérer les zones de disponibilité disponibles dans la région spécifiée
data "aws_availability_zones" "available" {}

locals {
  # Nom du cluster, défini par la variable clusterName
  cluster_name = var.clusterName
}
##