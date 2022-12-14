variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}
variable "clustername" {
  description = "AWS region"
  type        = string
  default     = "bettermarks"
}
variable "techstack-nodegroup" {
  description = "Nodegroup for tech stack components"
  default = "bettermarks-techstack"
  type = string  
}
variable "application-nodegroup" {
  description = "Nodegroup for application stack components"
  default = "bettermarks-appstack"
  type = string  
}