variable "db_username" {
    description = "The database username"
    type = string
    sensitive = true
}

variable "db_password" {
    description = "The database password"
    sensitive = true
}
