variable "server_port" {
  description = "The port number that will be used for HTTP server"
  type        = number
  default     = 8080
  
}

variable "cluster_name" {
  description = "The name to use for all cluster resorces"
  type = string
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state" #Bucket where the state file is
  type = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3" #Location of the state file in th bucket
  type = string
}

variable "instance_type" {
  description = "Type of EC2 instances to run"
  type = string  
}

variable "min_size" {
  description = "The minimum number of EC2 intances in the ASG"
  type = number
}

variable "max_size" {
  description = "The maximum number of EC2 intances in the ASG"
  type = number
}