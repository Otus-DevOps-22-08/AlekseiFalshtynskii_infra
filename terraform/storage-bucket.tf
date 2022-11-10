resource "yandex_storage_bucket" "my_storage_bucket" {
  access_key = var.sa_access_key
  secret_key = var.sa_secret_key
  bucket     = "tfstate6"
}
