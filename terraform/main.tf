terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "~> 0.2.0"
    }
  }
}

provider "virtualbox" {}

resource "virtualbox_vm" "kali" {
  name   = "kali-linux"
  image  = "${path.module}/iso/kali-linux.iso"
  cpus   = 2
  memory = 2048

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }
}

resource "virtualbox_vm" "ubuntu1" {
  name   = "ubuntu-1"
  image  = "${path.module}/iso/ubuntu-22.04.iso"
  cpus   = 2
  memory = 2048

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }
}

resource "virtualbox_vm" "ubuntu2" {
  name   = "ubuntu-2"
  image  = "${path.module}/iso/ubuntu-22.04.iso"
  cpus   = 2
  memory = 2048

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }
}

resource "virtualbox_vm" "pfsense" {
  name   = "pfsense"
  image  = "${path.module}/iso/pfSense.iso"
  cpus   = 2
  memory = 2048

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}