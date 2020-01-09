variable "region" {
    default = "us-east-1"
}

variable "namespace" {
    default = "rng"
}

variable "attributes" {
    default = []
}


variable "name" {
    default = "eks-fargate"
}

variable "stage" {
    default = "dev"
}

variable "delimiter" {
    default = "-"
}

variable "tags" {
    default = {
        "BusinessUnit" = "XYZ",
        "Snapshot"     = "true"
    }
}

variable "vpc_cidr_block" {
    default = "10.0.0.0/16"
}

variable "availability_zones" {
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "instance_types" {
    default = ["t2.small"]
}

variable "desired_size" {
    default = "3"
}

variable "min_size" {
    default = "3"
}

variable "max_size" {
    default = "3"
}

variable "kubeconfig_path" {
    default = "~/.kube/config"
}

variable "oidc_provider_enabled" {
    default = true
}



variable "kubernetes_version" {
    default = "1.14"
}

variable "kubernetes_labels" {
    default = {
        "name"         = "rng-k8-foundation",
        "environment"  = "fargate"
    }
}

variable "kubernetes_namespace" {
    default = "eks-fargate"
}
