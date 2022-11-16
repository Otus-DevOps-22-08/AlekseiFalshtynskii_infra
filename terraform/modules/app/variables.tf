variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "db_ip" {
  description = "Database instance ip"
}
variable "app_deploy" {
  description = "Need deploy app"
  type        = bool
  default     = true
}
