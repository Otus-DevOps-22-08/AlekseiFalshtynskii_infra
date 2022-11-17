terraform {

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tfstate6"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "replaced"
    secret_key = "replaced"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
