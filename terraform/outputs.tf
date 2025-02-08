output "cluster_name" {
  #une fois l'operation 'terraform apply'terminée avec succçs, on obtiendra ces infos : 

  # Description de la sortie, ici elle représente le nom du cluster EKS
  description = "Amazon Web Service EKS Cluster Name"
  
  # Valeur de la sortie, ici elle récupère le nom du cluster depuis le module EKS
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  # Description de la sortie, ici elle représente l'endpoint du cluster EKS
  description = "Endpoint for Amazon Web Service EKS"
  
  # Valeur de la sortie, ici elle récupère l'endpoint depuis le module EKS
  value       = module.eks.cluster_endpoint
}

output "region" {
  # Description de la sortie, ici elle représente la région du cluster EKS
  description = "Amazon Web Service EKS Cluster region"
  
  # Valeur de la sortie, ici elle récupère la région depuis la variable définie
  value       = var.region
}

output "cluster_security_group_id" {
  # Description de la sortie, ici elle représente l'ID du groupe de sécurité pour le cluster EKS
  description = "Security group ID for the Amazon Web Service EKS Cluster"
  
  # Valeur de la sortie, ici elle récupère l'ID du groupe de sécurité depuis le module EKS
  value       = module.eks.cluster_security_group_id
}

######""