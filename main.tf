terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "image" {
  name = "analyticsbd/anonimage:latest"
}

# Create a container
resource "docker_container" "container" {
  image = docker_image.image.image_id
  name  = "cont1"

  ports {
    internal = "80"
    external = "8080"
  }
}

