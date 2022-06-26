variable name { default = "vm-count"}
variable instance_count { default = 1 }
variable count_format { default = "%01d" }
variable count_offset { default = 0 }
variable cores { default = "2" }
variable memory { default = "4" }
variable subnet_id { default = "" }

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.75.0"
    }
  }
}

resource "yandex_compute_image" "default" {
  source_image = "fd8kp2fgjvpphbbnn375"
}

resource "yandex_compute_instance" "test-vm" {
  count       = var.instance_count
  name        = "${terraform.workspace}-${format(var.count_format, var.count_offset+count.index+1)}-${var.name}"
  platform_id = "standard-v1"
  hostname    = "${var.name}-${format(var.count_format, var.count_offset+count.index+1)}"
  zone        = "ru-central1-a"
  lifecycle {
    create_before_destroy = true
  }

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.default.id}"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
    ssh-keys = "centos:${file("/home/centos/.ssh/id_rsa.pub")}"
  }
}