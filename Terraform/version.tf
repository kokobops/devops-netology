terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "netology-kokobops"
    region     = "ru-central1"
    key        = "kokobops-bucket.tfstate"
    access_key = "YCAJEnIdXY34Dj4g2mhK2hbOp"
    secret_key = "YCPrtEO2Zl_zCd6C3wZo7IsSIW30QfdRWACJyjq7"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
