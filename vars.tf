variable "public_key_path" {
  description = "Enter the path to the SSH Public Key to add to AWS."
  default = "terraform.pub"
}
variable "key_name" {
  description = "Key name for SSHing into EC2"
  default = "terrademo"
}
