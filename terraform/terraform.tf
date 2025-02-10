terraform {
  # Définition des fournisseurs requis pour ce projet
  required_providers {
    aws = {
      # Source du fournisseur AWS, utilisé pour gérer les ressources AWS
      source = "hashicorp/aws"
      # Version du fournisseur, ici on utilise une version compatible avec 5.25.0
      version = "~> 5.25.0"
    }

    random = {
      # Source du fournisseur Random, utilisé pour générer des valeurs aléatoires
      source = "hashicorp/random"
      # Version du fournisseur
      version = "~> 3.5.1"
    }

    tls = {
      # Source du fournisseur TLS, utilisé pour gérer les certificats TLS
      source = "hashicorp/tls"
      # Version du fournisseur
      version = "~> 4.0.4"
    }

    cloudinit = {
      # Source du fournisseur CloudInit, utilisé pour configurer les instances au démarrage
      source = "hashicorp/cloudinit"
      # Version du fournisseur
      version = "~> 2.3.2"
    }

    kubernetes = {
      # Source du fournisseur Kubernetes, utilisé pour interagir avec un cluster Kubernetes
      source = "hashicorp/kubernetes"
      # Version du fournisseur
      version = "~> 2.23.0"
    }
  }

  # Configuration du backend pour stocker l'état de Terraform
  backend "s3" {
    # Nom du bucket S3 où l'état sera stocké
    bucket = "vprofile-actions121"
    # Clé (chemin) dans le bucket S3 pour le fichier d'état (il est essentiel d'avoir un fichier d'état Terraform centralisé)
    key = "terraform.tfstate"
    # Région AWS où se trouve le bucket S3
    region = "us-east-1"
  }

  # Version minimale requise de Terraform pour exécuter cette configuration
  # required_version = "~> 1.6.3"
  # required_version = "~> 1.9.2"
  required_version = "~> 1.10.0"
}
