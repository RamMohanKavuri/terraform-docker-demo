terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock" # For Linux/macOS; adjust for Windows
}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "nginx-terraform-demo"
  image = docker_image.nginx_image.name
  ports {
    internal = 80
    external = 8080
  }
}

