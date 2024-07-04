variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "region" {
  description = "The region of the service"
  type        = string
  #default     = ["asia-south1"]
}

variable "project" {
  description = "The name of Project"
  type        = string
  #default     = ["devops-test-428403"]
}

variable "cloud_run_service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "cloud_run_image" {
  description = "The Docker image for the Cloud Run service."
  type        = string
}

variable "cloud_run_memory" {
  description = "The memory allocation for the Cloud Run service (e.g., 256Mi, 512Mi, 1Gi)."
  type        = string
  default     = "256Mi"
}
