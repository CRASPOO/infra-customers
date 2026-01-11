terraform {
  required_providers {
    kubectl = {
      source = "alekc/kubectl"
      version = "2.1.3"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.38.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.auth.token
}

provider "kubectl" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.auth.token
  load_config_file       = false
}

terraform {
  backend "s3" {
    bucket = "sistemapedidos-eks"   # Nome do bucket
    key    = "terraform.tfstate"    # O nome do arquivo dentro do bucket
    region = "us-east-1"

  }
}