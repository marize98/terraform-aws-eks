variable "region" {
  default     = "eu-west-1"
  description = "AWS region"
}

locals {
  cluster_name = "my-bb-eks-${random_string.suffix.result}"
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = [
    "000000000000"
  ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      rolearn  = "arn:aws:iam::<AWS Account Number>:role/<role>"
      username = "<user-name>"
      groups   = ["system:masters"]
    },
     {
      rolearn  = "arn:aws:iam::<AWS Account Number>:role/role"
      username = "<user-name>"
      groups   = ["system:masters"]
    }
  ]
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::<AWS Account Number>:user/prg-bb-devops"
      username = "<user-name>"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::<AWS Account Number>:user/prg-bb"
      username = "<user-name>"
      groups   = ["system:masters"]
    }
  ]
}