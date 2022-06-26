variable "token" {
   type = string
}

provider "yandex" {
  token     = var.token
  cloud_id  = "b1guif57742i3jj2u5fk"
  folder_id = "b1ghp84ceh3vgfbcmrh2"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "net" {
  name = local.network_names[terraform.workspace]
}

resource "yandex_vpc_subnet" "subnet" {
  name           = local.subnet_names[terraform.workspace]
  zone           = "ru-central1-a"
  network_id     = resource.yandex_vpc_network.net.id
  v4_cidr_blocks = ["172.16.0.0/24"]
}

module "yc_instance_count" {
  source = "./instances/"
  instance_count = local.yc_instance_count[terraform.workspace]
  cores         = local.yc_cores[terraform.workspace]
  memory        = local.yc_memory[terraform.workspace]
  subnet_id     = resource.yandex_vpc_subnet.subnet.id
}

module "yc_instance_for_each" {
  source        = "./instances/"
  for_each      = local.for_each_map[terraform.workspace]
  name          = "${each.key}-vm-foreach"
  cores         = local.yc_cores[terraform.workspace]
  memory        = local.yc_memory[terraform.workspace]
  subnet_id     = resource.yandex_vpc_subnet.subnet.id
}

locals {
  yc_instance_count = {
    stage = 1
    prod  = 2
  }
  yc_cores = {
    stage = 2
    prod  = 4
  }
  yc_memory = {
    stage = 4
    prod  = 8
  }
  for_each_map = {
    stage = toset(["s1"])
    prod  = toset(["p1", "p2"])
  }
  network_names = {
    stage = "stage-net"
    prod  = "prod-net"
  }
  subnet_names = {
    stage = "stage-net-subnet"
    prod  = "prod-net-subnet"
  }
}