variable "db_username" {
    description = "The database username"
    type = string
    sensitive = true
}

variable "db_password" {
    description = "The database password"
    type = string
    sensitive = true
}

variable "db_name" {
    description = "The name of the database"
    type = string
}