variable "region" {
  # Description de la variable, ici elle représente la région AWS à utiliser
  description = "AWS region"

  # Type de la variable, spécifiant qu'il s'agit d'une chaîne de caractères
  type = string

  # Valeur par défaut de la variable, utilisée si aucune autre valeur n'est fournie
  default = "us-east-1"
}

variable "clusterName" {
  # Description de la variable, ici elle représente le nom du cluster EKS à créer
  description = "Name of the EKS cluster"

  # Type de la variable, spécifiant qu'il s'agit d'une chaîne de caractères
  type = string

  # Valeur par défaut de la variable, utilisée si aucune autre valeur n'est fournie
  default = "vprofile-eks"
}
